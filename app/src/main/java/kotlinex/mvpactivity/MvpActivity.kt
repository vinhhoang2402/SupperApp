package kotlinex.mvpactivity

import android.annotation.SuppressLint
import com.tbruyelle.rxpermissions2.RxPermissions
import kotlinex.context.showAlert
import vn.minerva.core.app.domain.excecutor.EventFireUtil
import vn.minerva.core.base.domain.listener.OnActionNotify
import vn.minerva.core.base.presentation.mvp.android.MvpActivity
import vn.minerva.sale.R

fun MvpActivity.showErrorAlert(msgError: String) {
    val activity = this
    activity.showAlert(msgError, activity.getString(R.string.error_title), null)
}

fun MvpActivity.showErrorAlert(msgError: String, onActionNotify: OnActionNotify) {
    val activity = this
    activity.showAlert(msgError, activity.getString(R.string.error_title), onActionNotify)
}

fun MvpActivity.showAlertNotTitle(msg: String) {
    val activity = this
    activity.showAlert(msg, activity.getString(R.string.error_title), null)
}

@SuppressLint("CheckResult")
fun MvpActivity.shouldShowCheckPermission(
    permission: MutableList<String>,
    onActionSuccess: OnActionNotify,
    onActionNotAccept: OnActionNotify,
    onActionNeverCall: OnActionNotify
) {
    RxPermissions(this)
        .requestEach(*permission.toTypedArray()).subscribe { per ->
            when {
                per.granted -> {
                    EventFireUtil.fireEvent(onActionSuccess)
                }
                per.shouldShowRequestPermissionRationale -> {
                    EventFireUtil.fireEvent(onActionNotAccept)
                }
                else -> {
                    EventFireUtil.fireEvent(onActionNeverCall)
                }
            }
        }
}
@SuppressLint("CheckResult")
fun MvpActivity.shouldShowCheckPermission(
    permission: String,
    onActionSuccess: OnActionNotify,
    onActionNotAccept: OnActionNotify,
    onActionNeverCall: OnActionNotify
) {
    RxPermissions(this)
        .requestEach(permission).subscribe { per ->
            when {
                per.granted -> {
                    EventFireUtil.fireEvent(onActionSuccess)
                }
                per.shouldShowRequestPermissionRationale -> {
                    EventFireUtil.fireEvent(onActionNotAccept)
                }
                else -> {
                    EventFireUtil.fireEvent(onActionNeverCall)
                }
            }
        }
}
