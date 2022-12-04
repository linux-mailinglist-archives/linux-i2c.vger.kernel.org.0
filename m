Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5DCF7641B7A
	for <lists+linux-i2c@lfdr.de>; Sun,  4 Dec 2022 09:19:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbiLDITD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 4 Dec 2022 03:19:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229630AbiLDITD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 4 Dec 2022 03:19:03 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AB7D14D1C;
        Sun,  4 Dec 2022 00:19:01 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id B6712CE09F9;
        Sun,  4 Dec 2022 08:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13D64C433C1;
        Sun,  4 Dec 2022 08:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1670141937;
        bh=86/+gNP4q9QUYHlNBqJiNaJDL7sSeWULV6yRUdVqXk4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CPNsF2JKKhb+bhoJKKJ/kD0Xq+qpOfjOhwqyhKp3TSO4/HDYi5u1RS36W2hzIpfRu
         N2G7d9N2XF+yFEstTmCPx1HeIKuCuuQTUYnrfjPO9hSETM1ONsvnwdxNXiNQYy2p3U
         tO+agxaecUtaIPIrGD0DQAtVcmRdf9aNkSJ9f74g=
Date:   Sun, 4 Dec 2022 09:18:52 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Daniel Beer <daniel.beer@igorinstitute.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-kernel@vger.kernel.org, linux-input@vger.kernel.org,
        linux-i2c@vger.kernel.org,
        Michael Zaidman <michael.zaidman@gmail.com>,
        Christina Quast <contact@christina-quast.de>,
        linux-serial@vger.kernel.org, Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH] hid-ft260: add UART support.
Message-ID: <Y4xX7ILXMFHZtJkv@kroah.com>
References: <638c51a2.170a0220.3af16.18f8@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <638c51a2.170a0220.3af16.18f8@mx.google.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Sat, Oct 22, 2022 at 11:19:20AM +1300, Daniel Beer wrote:
> Based on an earlier patch submitted by Christina Quast:
> 
>     https://patches.linaro.org/project/linux-serial/patch/20220928192421.11908-1-contact@christina-quast.de/

Please link to lore.kernel.org, we have no idea what will happen over
time to other domains/links.

> Simplified and reworked to use the UART API rather than the TTY layer
> directly. Transmit, receive and baud rate changes are supported.

Why use the uart layer?  Did you just change how the existing driver
works?

> +struct ft260_input_report {
> +	u8 report;		/* FT260_I2C_REPORT or FT260_UART_REPORT */
>  	u8 length;		/* data payload length */
> -	u8 data[2];		/* data payload */
> +	u8 data[0];		/* data payload */

Please do not use [0], use [], people are working to replace all [0]
instances in the kernel.

> +struct ft260_configure_uart_request {
> +	u8 report;		/* FT260_SYSTEM_SETTINGS */
> +	u8 request;		/* FT260_SET_UART_CONFIG */
> +	u8 flow_ctrl;		/* 0: OFF, 1: RTS_CTS, 2: DTR_DSR */
> +				/* 3: XON_XOFF, 4: No flow ctrl */
> +	__le32 baudrate;	/* little endian, 9600 = 0x2580, 19200 = 0x4B00 */

The data structure in the device really looks like this?  Unaligned
accesses are odd.

> +static void ft260_uart_set_termios(struct uart_port *port,
> +				   struct ktermios *termios,
> +				   const struct ktermios *old_termios)
> +{
> +	struct ft260_device *dev = container_of(port, struct ft260_device, port);
> +	struct hid_device *hdev = dev->hdev;
> +	unsigned int baud;
> +	struct ft260_configure_uart_request req;
> +	int ret;
> +
> +	ft260_dbg("%s uart\n", __func__);

Please just use ftrace, no need for any of these "I am here!" lines.

Also dev_dbg() functions already have __func__ in them, no need to ever
add them again.

> --- a/include/uapi/linux/major.h
> +++ b/include/uapi/linux/major.h
> @@ -175,4 +175,6 @@
>  #define BLOCK_EXT_MAJOR		259
>  #define SCSI_OSD_MAJOR		260	/* open-osd's OSD scsi device */
>  
> +#define FT260_MAJOR		261

A whole new major for just a single tty port?  Please no, use dynamic
majors if you have to, or better yet, tie into the usb-serial
implementation (this is a USB device, right?) and then you don't have to
mess with this at all.

> +
>  #endif
> diff --git a/include/uapi/linux/serial_core.h b/include/uapi/linux/serial_core.h
> index 3ba34d8378bd..d9a7025f467e 100644
> --- a/include/uapi/linux/serial_core.h
> +++ b/include/uapi/linux/serial_core.h
> @@ -276,4 +276,7 @@
>  /* Sunplus UART */
>  #define PORT_SUNPLUS	123
>  
> +/* FT260 HID UART */
> +#define PORT_FT260	124

Why is this required?  What userspace code needs this new id?  I want to
remove all of these ids, not add new ones.

thanks,

greg k-h
