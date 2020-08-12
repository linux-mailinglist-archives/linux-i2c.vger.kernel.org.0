Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FB43242764
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Aug 2020 11:22:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727021AbgHLJWW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Aug 2020 05:22:22 -0400
Received: from mga12.intel.com ([192.55.52.136]:51828 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726255AbgHLJWW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 12 Aug 2020 05:22:22 -0400
IronPort-SDR: jFnhjxRwcQ3aHPOchsz20rCN2MqpV+O0CJjE6JrZl/QHG5JoTal6W/P75edOeH5ltEQIh1p1AQ
 lffcaD8aEs3A==
X-IronPort-AV: E=McAfee;i="6000,8403,9710"; a="133448725"
X-IronPort-AV: E=Sophos;i="5.76,303,1592895600"; 
   d="scan'208";a="133448725"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2020 02:22:21 -0700
IronPort-SDR: QzZvGoaNu725tcJ3kPSkdq+/bdS/VEYAMGvlLi7ua24oPzZQufo2dbS/0GPWcjIq40Pb9RDKf/
 IrY3MqhaP5bg==
X-IronPort-AV: E=Sophos;i="5.76,303,1592895600"; 
   d="scan'208";a="369227319"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2020 02:22:17 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id CEBC920859; Wed, 12 Aug 2020 12:22:15 +0300 (EEST)
Date:   Wed, 12 Aug 2020 12:22:15 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Bingbu Cao <bingbu.cao@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@the-dreams.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajmohan.mani@intel.com, Tomasz Figa <tfiga@chromium.org>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Subject: Re: [PATCH v5 3/6] ov5670: Support probe whilst the device is in a
 low power state
Message-ID: <20200812092215.GL16270@paasikivi.fi.intel.com>
References: <20200810142747.12400-1-sakari.ailus@linux.intel.com>
 <20200810142747.12400-4-sakari.ailus@linux.intel.com>
 <7a1fa217-7fd1-1d36-0b1c-ad5d09ea11a0@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a1fa217-7fd1-1d36-0b1c-ad5d09ea11a0@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Bingbu,

Thanks for the review.

On Wed, Aug 12, 2020 at 05:12:28PM +0800, Bingbu Cao wrote:
> 
> 
> On 8/10/20 10:27 PM, Sakari Ailus wrote:
> > Tell ACPI device PM code that the driver supports the device being in a
> > low power state when the driver's probe function is entered.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/i2c/ov5670.c | 23 ++++++++++++++---------
> >  1 file changed, 14 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/ov5670.c b/drivers/media/i2c/ov5670.c
> > index f26252e35e08d..1f75b888d2a18 100644
> > --- a/drivers/media/i2c/ov5670.c
> > +++ b/drivers/media/i2c/ov5670.c
> > @@ -2456,6 +2456,7 @@ static int ov5670_probe(struct i2c_client *client)
> >  	struct ov5670 *ov5670;
> >  	const char *err_msg;
> >  	u32 input_clk = 0;
> > +	bool low_power;
> >  	int ret;
> >  
> >  	device_property_read_u32(&client->dev, "clock-frequency", &input_clk);
> > @@ -2472,11 +2473,14 @@ static int ov5670_probe(struct i2c_client *client)
> >  	/* Initialize subdev */
> >  	v4l2_i2c_subdev_init(&ov5670->sd, client, &ov5670_subdev_ops);
> >  
> > -	/* Check module identity */
> > -	ret = ov5670_identify_module(ov5670);
> > -	if (ret) {
> > -		err_msg = "ov5670_identify_module() error";
> > -		goto error_print;
> > +	low_power = acpi_dev_state_low_power(&client->dev);
> > +	if (!low_power) {
> > +		/* Check module identity */
> > +		ret = ov5670_identify_module(ov5670);
> > +		if (ret) {
> > +			err_msg = "ov5670_identify_module() error";
> > +			goto error_print;
> > +	
> 
> Sakari, thanks for your patch.
> one question - With this change, there will be no chance for driver to guarantee
> that the camera sensor plugged in is the camera that the matched driver actually
> can drive until try to streaming the camera, so is it necessary to return
> appropriate error in .s_stream ops to notify user it is not the hardware that
> current driver can drive? if no other better way.

Indeed sensor identification is now skipped in probe. I'll add that for v6
--- and check other drivers, too.

-- 
Kind regards,

Sakari Ailus
