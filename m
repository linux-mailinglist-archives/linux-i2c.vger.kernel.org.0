Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 497C56B20E7
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Mar 2023 11:06:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbjCIKGf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Mar 2023 05:06:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbjCIKGd (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Mar 2023 05:06:33 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BD5CE484B;
        Thu,  9 Mar 2023 02:06:32 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 13ECCB81E96;
        Thu,  9 Mar 2023 10:06:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36D7AC433EF;
        Thu,  9 Mar 2023 10:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678356389;
        bh=ligrysER57RAcFPf0WGf5No6WQpBg5r4d+YNFCXoq9w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bqfUGbj4ygde+9MLl/X/fkf2mK7lq+uWFeqw/9ylDJ/mYq9Y99D6AOQ+pcInkIaAU
         Car4zoa3Y8KVWsEdYO6Zxgh7ZVwyRRwXNeuJ/ZLzYGMU/ezDo1KD6a0C6Jjjs/VYdp
         jBPypYWaDNDBgBeo6mSnLZ2ZR2s3iNjywLhrwEilg+bKDEbfT1v0sKgMvYR3+K2zOM
         XsitYgct6Ft1bRxONf7dyPArfizcm2ah8Fh8tQeM/LfuloReCQlLF8NxNuffoxLknE
         9M2K5Rgz4/5vo2nmkPc1w7D6/8vHmEJ+R6xMo75y6gIkXVtjgbbYWP9ELmddQlgZSI
         gvuKlzZoR9GOQ==
Date:   Thu, 9 Mar 2023 11:06:25 +0100
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "Ye, Xiang" <xiang.ye@intel.com>, Arnd Bergmann <arnd@arndb.de>,
        Matthias Kaehlcke <mka@chromium.org>,
        Lee Jones <lee@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Tyrone Ting <kfting@nuvoton.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>, linux-usb@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org,
        srinivas.pandruvada@intel.com, heikki.krogerus@linux.intel.com,
        andriy.shevchenko@linux.intel.com, sakari.ailus@linux.intel.com,
        zhifeng.wang@intel.com, wentong.wu@intel.com, lixu.zhang@intel.com
Subject: Re: [PATCH v4 1/5] mfd: Add support for Intel LJCA device
Message-ID: <ZAmvocpy68qurCvt@intel.intel>
References: <20230309071100.2856899-1-xiang.ye@intel.com>
 <20230309071100.2856899-2-xiang.ye@intel.com>
 <ZAmQOIh/71rY4Pa4@kroah.com>
 <ZAmngB84ty1flD9K@ye-NUC7i7DNHE>
 <ZAmpse14Evvrfa/f@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZAmpse14Evvrfa/f@kroah.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Thu, Mar 09, 2023 at 10:41:05AM +0100, Greg Kroah-Hartman wrote:
> On Thu, Mar 09, 2023 at 05:31:44PM +0800, Ye, Xiang wrote:
> > On Thu, Mar 09, 2023 at 08:52:24AM +0100, Greg Kroah-Hartman wrote:
> > > On Thu, Mar 09, 2023 at 03:10:56PM +0800, Ye Xiang wrote:
> > > > +static int ljca_mng_get_version(struct ljca_stub *stub, char *buf)
> > > > +{
> > > > +	struct fw_version version = {};
> > > > +	unsigned int len = sizeof(version);
> > > > +	int ret;
> > > > +
> > > > +	ret = ljca_stub_write(stub, LJCA_MNG_GET_VERSION, NULL, 0, &version, &len, true,
> > > > +			      LJCA_USB_WRITE_ACK_TIMEOUT_MS);
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	if (len != sizeof(version)) {
> > > > +		dev_err(&stub->intf->dev, "get version failed, len:%d\n", len);
> > > > +		return -EINVAL;
> > > > +	}
> > > > +
> > > > +	return sysfs_emit(buf, "%d.%d.%d.%d\n", version.major, version.minor,
> > > > +			  le16_to_cpu(version.patch), le16_to_cpu(version.build));
> > > > +}
> > > 
> > > You have sysfs files, yet no Documentation/ABI/ entries?  That's not
> > > allowed, you know this :(
> > The Documentation/ABI/ entries is added for the sysfs on patch 5 of this series.
> > https://patchwork.kernel.org/project/linux-usb/patch/20230309071100.2856899-6-xiang.ye@intel.com/
> 
> Ah, missed that, sorry.
> 
> > > 
> > > > +static ssize_t cmd_store(struct device *dev, struct device_attribute *attr, const char *buf,
> > > > +			 size_t count)
> > > > +{
> > > > +	struct usb_interface *intf = to_usb_interface(dev);
> > > > +	struct ljca_dev *ljca_dev = usb_get_intfdata(intf);
> > > > +	struct ljca_stub *mng_stub = ljca_stub_find(ljca_dev, LJCA_MNG_STUB);
> > > > +	struct ljca_stub *diag_stub = ljca_stub_find(ljca_dev, LJCA_DIAG_STUB);
> > > > +
> > > > +	if (sysfs_streq(buf, "dfu"))
> > > > +		ljca_mng_set_dfu_mode(mng_stub);
> > > > +	else if (sysfs_streq(buf, "debug"))
> > > > +		ljca_diag_set_trace_level(diag_stub, 3);
> > > 
> > > Sorry, but no, you can't do this in a sysfs file.
> > Do you mean that we can't use sysfs to send "debug" command to device?
> 
> That is correct, use the kernel-wide debugging facilities that we have
> for this NEVER create your own custom interface just for one tiny
> driver, that is not allowed.
> 
> > Could you provide some detail or hints?
> 
> dev_dbg().

I'm not sure this is the same thing, though, as it's not a drvier
to user debug message.

Ye, can you please explain better what this command does? You are
sending a LJCA_DIAG_SET_TRACE_LEVEL command to the device with a
parameter "3" which has a meaining only for you :)

What is ugly here is the parsing of "dfu" and "debug", I would
just make different boolean files, something like:

 echo 1 > ljca_dfu
 echo 0 > ljca_dfu

and

 echo N > ljca_trace_level

with a proper documentation of the trace levels.

The show counterparast can provide a feedback on how the
interfaces are set rather than providing some help message, which
is not what sysfs files are meant for.

Would this work?

Andi
