Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD786262CB
	for <lists+linux-i2c@lfdr.de>; Wed, 22 May 2019 13:12:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728744AbfEVLMx (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 22 May 2019 07:12:53 -0400
Received: from mga03.intel.com ([134.134.136.65]:32361 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728743AbfEVLMx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 22 May 2019 07:12:53 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 22 May 2019 04:12:52 -0700
X-ExtLoop1: 1
Received: from kuha.fi.intel.com ([10.237.72.189])
  by fmsmga001.fm.intel.com with SMTP; 22 May 2019 04:12:49 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Wed, 22 May 2019 14:12:48 +0300
Date:   Wed, 22 May 2019 14:12:48 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Ajay Gupta <ajayg@nvidia.com>
Cc:     Ajay Gupta <ajaykuee@gmail.com>,
        "wsa@the-dreams.de" <wsa@the-dreams.de>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2 3/5] usb: typec: ucsi: ccg: enable runtime pm support
Message-ID: <20190522111248.GM1887@kuha.fi.intel.com>
References: <20190520183750.2932-1-ajayg@nvidia.com>
 <20190520183750.2932-4-ajayg@nvidia.com>
 <20190521133727.GK1887@kuha.fi.intel.com>
 <BYAPR12MB2727A21E3AB497C26BA699D2DC070@BYAPR12MB2727.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BYAPR12MB2727A21E3AB497C26BA699D2DC070@BYAPR12MB2727.namprd12.prod.outlook.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Tue, May 21, 2019 at 05:44:50PM +0000, Ajay Gupta wrote:
> Hi Heikki
> 
> > > +static int ucsi_ccg_resume(struct device *dev) {
> > > +	struct i2c_client *client = to_i2c_client(dev);
> > > +	struct ucsi_ccg *uc = i2c_get_clientdata(client);
> > > +	struct ucsi *ucsi = uc->ucsi;
> > > +	struct ucsi_control c;
> > > +	int ret;
> > > +
> > > +	/* restore UCSI notification enable mask */
> > > +	UCSI_CMD_SET_NTFY_ENABLE(c, UCSI_ENABLE_NTFY_ALL);
> > > +	ret = ucsi_send_command(ucsi, &c, NULL, 0);
> > > +	if (ret < 0) {
> > > +		dev_err(uc->dev, "%s: failed to set notification enable - %d\n",
> > > +			__func__, ret);
> > > +	}
> > > +	return 0;
> > > +}
> > 
> > I would prefer that we did this for all methods in ucsi.c, not just ccgx. Could you
> > add resume callback to struct ucsi_ppm, and then call it here.
> struct ucsi_ppm currently have .sync() and .cmd() callback which is implemented by
> ucsi_ccg and ucsi_acpi and invoked by usci.c. 
> 
> Is it okay to add a callback in this structure and implement inside ucsi.c and invoke
> from ucsi_ccg and ucsi_acpi? OR we can just add a function in ucsi.c and export it
> and use it from ucsi_ccg and ucsi_acpi?

Right! Export the function. Sorry.

thanks,

-- 
heikki
