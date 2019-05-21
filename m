Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3F3125111
	for <lists+linux-i2c@lfdr.de>; Tue, 21 May 2019 15:49:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728319AbfEUNtx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 May 2019 09:49:53 -0400
Received: from mga09.intel.com ([134.134.136.24]:16391 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728207AbfEUNtx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 May 2019 09:49:53 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 21 May 2019 06:49:51 -0700
X-ExtLoop1: 1
Received: from kuha.fi.intel.com ([10.237.72.189])
  by fmsmga001.fm.intel.com with SMTP; 21 May 2019 06:49:48 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 21 May 2019 16:49:48 +0300
Date:   Tue, 21 May 2019 16:49:48 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ajay Gupta <ajaykuee@gmail.com>
Cc:     wsa@the-dreams.de, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, Ajay Gupta <ajayg@nvidia.com>
Subject: Re: [PATCH v2 3/5] usb: typec: ucsi: ccg: enable runtime pm support
Message-ID: <20190521134948.GL1887@kuha.fi.intel.com>
References: <20190520183750.2932-1-ajayg@nvidia.com>
 <20190520183750.2932-4-ajayg@nvidia.com>
 <20190521133727.GK1887@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190521133727.GK1887@kuha.fi.intel.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 21, 2019 at 04:37:27PM +0300, Heikki Krogerus wrote:
> Hi,
> 
> On Mon, May 20, 2019 at 11:37:48AM -0700, Ajay Gupta wrote:
> > +static int ucsi_ccg_resume(struct device *dev)
> > +{
> > +	struct i2c_client *client = to_i2c_client(dev);
> > +	struct ucsi_ccg *uc = i2c_get_clientdata(client);
> > +	struct ucsi *ucsi = uc->ucsi;
> > +	struct ucsi_control c;
> > +	int ret;
> > +
> > +	/* restore UCSI notification enable mask */
> > +	UCSI_CMD_SET_NTFY_ENABLE(c, UCSI_ENABLE_NTFY_ALL);
> > +	ret = ucsi_send_command(ucsi, &c, NULL, 0);
> > +	if (ret < 0) {
> > +		dev_err(uc->dev, "%s: failed to set notification enable - %d\n",
> > +			__func__, ret);
> > +	}
> > +	return 0;
> > +}
> 
> I would prefer that we did this for all methods in ucsi.c, not just
> ccgx. Could you add resume callback to struct ucsi_ppm, and then call
> it here.
> 
> > +static int ucsi_ccg_runtime_suspend(struct device *dev)
> > +{
> > +	return 0;
> > +}
> > +
> > +static int ucsi_ccg_runtime_resume(struct device *dev)
> > +{
> > +	return 0;
> > +}
> > +
> > +static int ucsi_ccg_runtime_idle(struct device *dev)
> > +{
> > +	return 0;
> > +}

Oh yes, and do you really need to supply all of those stubs?

thanks,

-- 
heikki
