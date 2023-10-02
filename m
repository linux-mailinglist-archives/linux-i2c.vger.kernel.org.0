Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D41377B5162
	for <lists+linux-i2c@lfdr.de>; Mon,  2 Oct 2023 13:31:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236835AbjJBLbQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 Oct 2023 07:31:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236843AbjJBLbG (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 Oct 2023 07:31:06 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EF861722;
        Mon,  2 Oct 2023 04:30:22 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFAA0C433C7;
        Mon,  2 Oct 2023 11:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1696246221;
        bh=eLP1rteqSM+m4kcG2++s4zrtyidQsjL6rtGDvWSti3U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=s+HOBDlssDRzBEXCbgR4uRQugNkZ99W/gvmGIptbV/M82fhdU4miCrtxMSoYXn2b/
         wQymwspi8gsR67RgGlB0No/Zspp1Ppwrdwx01FHxnx+N38cgRwbtouXfmlMvr1EJ9G
         DhkAoxQ2T1MMKOQlipI4+jjJaqmlhDIDr01uId8M=
Date:   Mon, 2 Oct 2023 13:30:19 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "Wu, Wentong" <wentong.wu@intel.com>
Cc:     "arnd@arndb.de" <arnd@arndb.de>,
        "mka@chromium.org" <mka@chromium.org>,
        "oneukum@suse.com" <oneukum@suse.com>,
        "lee@kernel.org" <lee@kernel.org>,
        "wsa@kernel.org" <wsa@kernel.org>,
        "kfting@nuvoton.com" <kfting@nuvoton.com>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "maz@kernel.org" <maz@kernel.org>, "brgl@bgdev.pl" <brgl@bgdev.pl>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "andi.shyti@linux.intel.com" <andi.shyti@linux.intel.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "bartosz.golaszewski@linaro.org" <bartosz.golaszewski@linaro.org>,
        "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>
Subject: Re: [PATCH v19 1/4] usb: Add support for Intel LJCA device
Message-ID: <2023100229-immodest-cattishly-2ea1@gregkh>
References: <1694890416-14409-1-git-send-email-wentong.wu@intel.com>
 <1694890416-14409-2-git-send-email-wentong.wu@intel.com>
 <2023092857-atrium-scared-b624@gregkh>
 <DM6PR11MB4316E03DA12320D62995F15B8DC0A@DM6PR11MB4316.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB4316E03DA12320D62995F15B8DC0A@DM6PR11MB4316.namprd11.prod.outlook.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Fri, Sep 29, 2023 at 11:31:21AM +0000, Wu, Wentong wrote:
> > From: Greg KH <gregkh@linuxfoundation.org>
> > On Sun, Sep 17, 2023 at 02:53:33AM +0800, Wentong Wu wrote:
> > > +static void ljca_handle_event(struct ljca_adapter *adap,
> > > +			      struct ljca_msg *header)
> > > +{
> > > +	struct ljca_client *client;
> > > +
> > > +	list_for_each_entry(client, &adap->client_list, link) {
> > > +		/*
> > > +		 * FIXME: currently only GPIO register event callback.
> > > +		 * firmware message structure should include id when
> > > +		 * multiple same type clients register event callback.
> > > +		 */
> > 
> > When will this be fixed?
> > 
> > If not now, why not?
> 
> Actually this doesn't impact current functionality because only GPIO register
> event callback, but from coding perspective it should add the id in the message
> structure. This fix should be done by firmware first, but many products have
> already been running the firmware, it's not easy to update the firmware.
> 
> Can I just remove the 'FIXME' and leave the comment here?

If you are never going to fix it, it does not need a FIXME, right?  :)

> > > +		spin_unlock_irqrestore(&adap->lock, flags);
> > > +		return;
> > > +	}
> > > +
> > > +	ibuf_len = adap->ex_buf_len;
> > > +	ibuf = adap->ex_buf;
> > > +
> > > +	if (ibuf && ibuf_len) {
> > > +		actual_len = min_t(unsigned int, header->len, ibuf_len);
> > 
> > You control both of these types, why aren't they the same type to start with?
> > Why the force cast?
> 
> The len of header is defined by firmware, it should be u8 type. But the ex_buf_len
> is passed by API users, I don't want users to do the cast if their buffer is large than
> 256.

Then fix the api to use a u8 as obviously you can not handle more data
then that for now.

> > > +
> > > +		/* copy received data to external buffer */
> > > +		memcpy(ibuf, header->data, actual_len);
> > > +	}
> > > +	/* update copied data length */
> > > +	adap->actual_length = actual_len;
> > 
> > Wait, what happens if you don't actually copy the data?
> 
> This actual_length is the actual length of data copied to external buffer
> where is to save the command response. The API callers should check
> the response length according to the command you passed to this API.

But they aren't checking it as I pointed out elsewhere.

> > > +}
> > > +
> > > +static int ljca_send(struct ljca_adapter *adap, u8 type, u8 cmd,
> > > +		     const u8 *obuf, unsigned int obuf_len, u8 *ibuf,
> > > +		     unsigned int ibuf_len, bool ack, unsigned long timeout) {
> > > +	unsigned int msg_len = sizeof(struct ljca_msg) + obuf_len;
> > > +	struct ljca_msg *header = adap->tx_buf;
> > > +	unsigned int actual;
> > > +	int ret = 0;
> > > +
> > > +	if (adap->disconnect)
> > > +		return -ENODEV;
> > > +
> > > +	if (msg_len > adap->tx_buf_len)
> > > +		return -EINVAL;
> > > +
> > > +	mutex_lock(&adap->mutex);
> > > +
> > > +	scoped_guard(spinlock_irqsave, &adap->lock) {
> > > +		header->type = type;
> > > +		header->cmd = cmd;
> > > +		header->len = obuf_len;
> > > +		if (obuf)
> > > +			memcpy(header->data, obuf, obuf_len);
> > > +		header->flags = LJCA_CMPL_FLAG | (ack ? LJCA_ACK_FLAG : 0);
> > > +
> > > +		adap->ex_buf = ibuf;
> > > +		adap->ex_buf_len = ibuf_len;
> > > +		adap->actual_length = 0;
> > > +	}
> > 
> > Do you really need a scoped guard when you can not fail out of the block?
> 
> The scoped_guard is required by you with "Why not use the functionality in
> cleanup.h for this lock? Makes this function much simpler." If I understand
> correctly, so I use the scoped_guard where I can to make things simpler.

But that's not making anything simpler here, cleanup.h works well when
you have error paths that would be more complex without it.  You do not
have that here at all now (maybe you did before?)

> > Why do you have both a mutex and spinlock grabed?
> 
> The mutex is to avoid command download concurrently
> 
> The spinlock is to protect tx_buf and ex_buf, which may be accessed by tx and rx
> at the same time.

Please document this somewhere.

> > > +	ret = usb_bulk_msg(adap->usb_dev, adap->tx_pipe, header,
> > > +			   msg_len, &actual, LJCA_WRITE_TIMEOUT_MS);
> > > +
> > > +	usb_autopm_put_interface(adap->intf);
> > > +
> > > +	if (!ret && ack) {
> > > +		ret = wait_for_completion_timeout(&adap->cmd_completion,
> > > +						  timeout);
> > > +		if (ret < 0) {
> > > +			goto out;
> > > +		} if (!ret) {
> > > +			ret = -ETIMEDOUT;
> > > +			goto out;
> > > +		}
> > > +	}
> > > +	ret = adap->actual_length;
> > 
> > Why are you not verifying that you sent what you wanted to send?
> 
> As I said, the actual_length is the actual length of data copied to user buffer instead
> of the length of what we want to send.
> 
> And even for verifying the length of what we want to send, the max length of the
> message is sizeof(struct ljca_msg) + LJCA_MAX_PACKET_SIZE which is less than
> the endpoint's max packet size, so I don't check the actual sent length in above
> usb_bulk_msg().

But you need to.

> > When you call this function, sometimes you check that the function sent the
> > proper amount of data, but in many places you do not, and you assume that the
> > full buffer was sent, which is not correct.  So please change _this_ function to
> > check that you sent the proper amount and then the caller logic will be much
> > simpler and actually work like you are using it in many places (some places you
> > got it right, some wrong, which is a HUGE indication that the API is wrong
> > because you wrote this code, and if you can't get it right...)
> 
> As I said, the return value of this function is the response data length instead of
> sent data length. And in this patch set, every caller has verified if the response
> length matched with the sent command. 

No, I found many users that did not do this.  Please make the api easy
to use, right now it's not.

> > > +static int ljca_match_device_ids(struct acpi_device *adev, void
> > > +*data) {
> > > +	struct ljca_match_ids_walk_data *wd = data;
> > > +	const char *uid = acpi_device_uid(adev);
> > > +
> > > +	if (acpi_match_device_ids(adev, wd->ids))
> > > +		return 0;
> > > +
> > > +	if (!wd->uid)
> > > +		goto match;
> > > +
> > > +	if (!uid)
> > > +		uid = "0";
> > 
> > Are you sure this is a valid uid to use?  If so, why?  What happens if this gets set
> > to "0" for multiple ones?  Don't underestimate broken firmware tables, but also
> > don't paper over problems in ways that will be impossible to notice and can
> > cause problems.
> 
> This actually has been discussed in previous email as bellow: 
> 
> some DSDTs have only 1 ACPI companion for the 2 I2C controllers
> and these don't set a UID at all. On these models only the first I2C
> controller is used. So if a HID match has no UID use "0" for the HID.
> assigning the ACPI companion to the first I2C controller.
> An example device with this setup is the Dell Latitude 9420.

Then document this really really well in the code itself, otherwise it
looks broken.

> > > +static int ljca_enumerate_clients(struct ljca_adapter *adap) {
> > > +	int ret;
> > > +
> > > +	ret = ljca_reset_handshake(adap);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	ret = ljca_enumerate_gpio(adap);
> > > +	if (ret)
> > > +		dev_warn(adap->dev, "enumerate GPIO error\n");
> > > +
> > > +	ret = ljca_enumerate_i2c(adap);
> > > +	if (ret)
> > > +		dev_warn(adap->dev, "enumerate I2C error\n");
> > > +
> > > +	ret = ljca_enumerate_spi(adap);
> > > +	if (ret)
> > > +		dev_warn(adap->dev, "enumerate SPI error\n");
> > 
> > So none of these "errors" are actually errors:
> > 
> > > +	return 0;
> > 
> > You return success?  Why?  Are they not actually problems?
> 
> This is to be compatible with old version FW which does not support
> full USB2xxx functions, so it just warn here as this is.

Why do you have to support obsolete and broken firmware?  Can't it be
updated?

> To make things more clear, I re-structure this as below, hope that
> helps, thanks
> 
> static int ljca_enumerate_clients(struct ljca_adapter *adap)
> {
> 	struct ljca_client *client, *next;
> 	int ret;
> 
> 	ret = ljca_reset_handshake(adap);
> 	if (ret)
> 		return ret;
> 
> 	ret = ljca_enumerate_gpio(adap);
> 	if (ret)
> 		goto err_free;
> 
> 	ret = ljca_enumerate_i2c(adap);
> 	if (ret)
> 		goto err_free;
> 
> 	ret = ljca_enumerate_spi(adap);
> 	if (ret)
> 		goto err_free;
> 
> 	return 0;
> 
> err_free:
> 	adap->disconnect = true;
> 
> 	list_for_each_entry_safe_reverse(client, next, &adap->client_list, link) {
> 		auxiliary_device_delete(&client->auxdev);
> 		auxiliary_device_uninit(&client->auxdev);
> 
> 		list_del_init(&client->link);
> 		kfree(client);
> 	}
> 
> 	return ret;
> }
> 
> And accordingly, the ljca_enumerate_xxx() has slightly change to cover the
> unsupported case as below( take spi as an example)
> 
> @@ -617,6 +633,11 @@ static int ljca_enumerate_spi(struct ljca_adapter *adap)
>  
>         ret = ljca_send(adap, LJCA_CLIENT_MNG, LJCA_MNG_ENUM_SPI, NULL, 0, buf,
>                         sizeof(buf), true, LJCA_ENUM_CLIENT_TIMEOUT_MS);
> +       if (ret == -ETIMEDOUT) {
> +               dev_warn(adap->dev, "doesn't support SPI function\n");
> +               return 0;

You warn, yet return success?  Again, that doesn't work well as you
never know if you need to unwind it or not.

Either report an error and handle it, or don't, but what you have here
looks broken as-is.

thanks,

greg k-h
