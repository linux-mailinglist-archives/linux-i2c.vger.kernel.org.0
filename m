Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A50B538611
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Jun 2019 10:25:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726667AbfFGIZO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Jun 2019 04:25:14 -0400
Received: from mga12.intel.com ([192.55.52.136]:46498 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725978AbfFGIZO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 7 Jun 2019 04:25:14 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Jun 2019 01:25:13 -0700
X-ExtLoop1: 1
Received: from kuha.fi.intel.com ([10.237.72.189])
  by fmsmga001.fm.intel.com with SMTP; 07 Jun 2019 01:25:11 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Fri, 07 Jun 2019 11:25:10 +0300
Date:   Fri, 7 Jun 2019 11:25:10 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ajay Gupta <ajaykuee@gmail.com>, Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-usb@vger.kernel.org, linux-i2c@vger.kernel.org,
        Ajay Gupta <ajayg@nvidia.com>
Subject: Re: [PATCH v4 3/5] usb: typec: ucsi: ccg: enable runtime pm support
Message-ID: <20190607082510.GB10298@kuha.fi.intel.com>
References: <20190603170545.24004-1-ajayg@nvidia.com>
 <20190603170545.24004-4-ajayg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190603170545.24004-4-ajayg@nvidia.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Mon, Jun 03, 2019 at 10:05:43AM -0700, Ajay Gupta wrote:
> From: Ajay Gupta <ajayg@nvidia.com>
> 
> The change enables runtime pm support to UCSI CCG driver.
> Added ucsi_resume() function to enable notification after
> system reusme. Exported both ucsi_resume() and ucsi_send_command()
> symbols in ucsi.c for modular build.
> 
> Signed-off-by: Ajay Gupta <ajayg@nvidia.com>

Was the idea that Wolfram picks these? In that case:

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> Changes from v3->v4 : None
> 
>  drivers/usb/typec/ucsi/ucsi.c     | 10 ++++++++
>  drivers/usb/typec/ucsi/ucsi.h     |  1 +
>  drivers/usb/typec/ucsi/ucsi_ccg.c | 38 +++++++++++++++++++++++++++++++
>  3 files changed, 49 insertions(+)
> 
> diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> index 7850b851cecd..ba288b964dc8 100644
> --- a/drivers/usb/typec/ucsi/ucsi.c
> +++ b/drivers/usb/typec/ucsi/ucsi.c
> @@ -206,7 +206,17 @@ int ucsi_send_command(struct ucsi *ucsi, struct ucsi_control *ctrl,
>  
>  	return ret;
>  }
> +EXPORT_SYMBOL_GPL(ucsi_send_command);
>  
> +int ucsi_resume(struct ucsi *ucsi)
> +{
> +	struct ucsi_control ctrl;
> +
> +	/* Restore UCSI notification enable mask after system resume */
> +	UCSI_CMD_SET_NTFY_ENABLE(ctrl, UCSI_ENABLE_NTFY_ALL);
> +	return ucsi_send_command(ucsi, &ctrl, NULL, 0);
> +}
> +EXPORT_SYMBOL_GPL(ucsi_resume);
>  /* -------------------------------------------------------------------------- */
>  
>  void ucsi_altmode_update_active(struct ucsi_connector *con)
> diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
> index 1e2981aef629..de87d0b8319d 100644
> --- a/drivers/usb/typec/ucsi/ucsi.h
> +++ b/drivers/usb/typec/ucsi/ucsi.h
> @@ -430,6 +430,7 @@ int ucsi_send_command(struct ucsi *ucsi, struct ucsi_control *ctrl,
>  		      void *retval, size_t size);
>  
>  void ucsi_altmode_update_active(struct ucsi_connector *con);
> +int ucsi_resume(struct ucsi *ucsi);
>  
>  #if IS_ENABLED(CONFIG_TYPEC_DP_ALTMODE)
>  struct typec_altmode *
> diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
> index 9d46aa9e4e35..b15bc6c29c46 100644
> --- a/drivers/usb/typec/ucsi/ucsi_ccg.c
> +++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
> @@ -14,6 +14,8 @@
>  #include <linux/module.h>
>  #include <linux/pci.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm.h>
> +#include <linux/pm_runtime.h>
>  
>  #include <asm/unaligned.h>
>  #include "ucsi.h"
> @@ -210,6 +212,7 @@ static int ccg_read(struct ucsi_ccg *uc, u16 rab, u8 *data, u32 len)
>  	if (quirks && quirks->max_read_len)
>  		max_read_len = quirks->max_read_len;
>  
> +	pm_runtime_get_sync(uc->dev);
>  	while (rem_len > 0) {
>  		msgs[1].buf = &data[len - rem_len];
>  		rlen = min_t(u16, rem_len, max_read_len);
> @@ -218,12 +221,14 @@ static int ccg_read(struct ucsi_ccg *uc, u16 rab, u8 *data, u32 len)
>  		status = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
>  		if (status < 0) {
>  			dev_err(uc->dev, "i2c_transfer failed %d\n", status);
> +			pm_runtime_put_sync(uc->dev);
>  			return status;
>  		}
>  		rab += rlen;
>  		rem_len -= rlen;
>  	}
>  
> +	pm_runtime_put_sync(uc->dev);
>  	return 0;
>  }
>  
> @@ -249,13 +254,16 @@ static int ccg_write(struct ucsi_ccg *uc, u16 rab, u8 *data, u32 len)
>  	msgs[0].len = len + sizeof(rab);
>  	msgs[0].buf = buf;
>  
> +	pm_runtime_get_sync(uc->dev);
>  	status = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
>  	if (status < 0) {
>  		dev_err(uc->dev, "i2c_transfer failed %d\n", status);
> +		pm_runtime_put_sync(uc->dev);
>  		kfree(buf);
>  		return status;
>  	}
>  
> +	pm_runtime_put_sync(uc->dev);
>  	kfree(buf);
>  	return 0;
>  }
> @@ -1134,6 +1142,10 @@ static int ucsi_ccg_probe(struct i2c_client *client,
>  	if (status)
>  		dev_err(uc->dev, "cannot create sysfs group: %d\n", status);
>  
> +	pm_runtime_set_active(uc->dev);
> +	pm_runtime_enable(uc->dev);
> +	pm_runtime_idle(uc->dev);
> +
>  	return 0;
>  }
>  
> @@ -1143,6 +1155,7 @@ static int ucsi_ccg_remove(struct i2c_client *client)
>  
>  	cancel_work_sync(&uc->work);
>  	ucsi_unregister_ppm(uc->ucsi);
> +	pm_runtime_disable(uc->dev);
>  	free_irq(uc->irq, uc);
>  	sysfs_remove_group(&uc->dev->kobj, &ucsi_ccg_attr_group);
>  
> @@ -1155,9 +1168,34 @@ static const struct i2c_device_id ucsi_ccg_device_id[] = {
>  };
>  MODULE_DEVICE_TABLE(i2c, ucsi_ccg_device_id);
>  
> +static int ucsi_ccg_resume(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct ucsi_ccg *uc = i2c_get_clientdata(client);
> +
> +	return ucsi_resume(uc->ucsi);
> +}
> +
> +static int ucsi_ccg_runtime_suspend(struct device *dev)
> +{
> +	return 0;
> +}
> +
> +static int ucsi_ccg_runtime_resume(struct device *dev)
> +{
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops ucsi_ccg_pm = {
> +	.resume = ucsi_ccg_resume,
> +	.runtime_suspend = ucsi_ccg_runtime_suspend,
> +	.runtime_resume = ucsi_ccg_runtime_resume,
> +};
> +
>  static struct i2c_driver ucsi_ccg_driver = {
>  	.driver = {
>  		.name = "ucsi_ccg",
> +		.pm = &ucsi_ccg_pm,
>  	},
>  	.probe = ucsi_ccg_probe,
>  	.remove = ucsi_ccg_remove,
> -- 
> 2.17.1

thanks,

-- 
heikki
