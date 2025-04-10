Return-Path: <linux-i2c+bounces-10246-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B95A838DD
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Apr 2025 08:05:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5000B1B605D4
	for <lists+linux-i2c@lfdr.de>; Thu, 10 Apr 2025 06:05:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7194D201278;
	Thu, 10 Apr 2025 06:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pE6bNzha"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D7417A309;
	Thu, 10 Apr 2025 06:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744265094; cv=none; b=K7UkSybUxqXo5+BsySUIjEH2Xewo5xz7VwerWgasqNCCRlO4fBXxFf7b9goCc8ATaY65rPEglbsQv6IcV30wzGpLj1rAY16roLcbIu8N1+6dahDpEPzgsha9Y7E7Rh5/oKk2N2pZIF+kN7CKcCxH9n4ek0ZeN0fUfEAJdfCmrqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744265094; c=relaxed/simple;
	bh=FYrBWSCKFVtEQ8dqrWonuh8PblTo1bjrFXM916oA1Z8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HKtiSsZ7q+JTHiudKcdNxJOWOjo6CXzAez8xJ+IrfQvewV06WJU+g4aPQxRW8GWwECj5ueg+jvIAEKMhqlnzogGyTy2VeOE/VntdzYsIdlrCYTKL32bpeGW4AV+h9w3zBibsEy90C5lwK+2s2tHq/1+9c9xb3V1bJ4TDSSckal0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pE6bNzha; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C720EC4CEE8;
	Thu, 10 Apr 2025 06:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744265093;
	bh=FYrBWSCKFVtEQ8dqrWonuh8PblTo1bjrFXM916oA1Z8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pE6bNzhaXcXOVCREnHA9o+CvitfxrvKq4sQ8deVGbMdDCLRhGoX/LalA91CeAbe24
	 9X3bAWjtstpdxGKLt3vxoGsjQj7oM/WM7Xo4778mqYlrztV9TOz9PVAhooXj35XDZV
	 6k/SlLjwchM7YQjuusm1VP+UC9o+5R6U62fVaaLCVNI+Cx2qQ+JVxEZgp/HiarRnLu
	 pJqYY5blC7Zr1sCy5uerI3dXcdekHYjBzbZhzpbv9E7s9FEgV0WdG+62Im2dlAySfb
	 ySMiUXnuQNVO3akeP3JoKh31HY6WOGig4Va/c0PA8eA2sPpUcpkURLrayFoVt3PyBi
	 oSjLCjHLVXWwA==
Message-ID: <11d2541e-580b-4060-ad92-ed721e98793e@kernel.org>
Date: Thu, 10 Apr 2025 08:04:45 +0200
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/7] mfd: Add core driver for Nuvoton NCT6694
To: a0282524688@gmail.com, lee@kernel.org, linus.walleij@linaro.org,
 brgl@bgdev.pl, andi.shyti@kernel.org, mkl@pengutronix.de,
 mailhol.vincent@wanadoo.fr, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 wim@linux-watchdog.org, linux@roeck-us.net, jdelvare@suse.com,
 alexandre.belloni@bootlin.com
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-can@vger.kernel.org,
 netdev@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-usb@vger.kernel.org, Ming Yu <tmyu0@nuvoton.com>
References: <20250409082752.3697532-1-tmyu0@nuvoton.com>
 <20250409082752.3697532-2-tmyu0@nuvoton.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250409082752.3697532-2-tmyu0@nuvoton.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09/04/2025 10:27, a0282524688@gmail.com wrote:
> +
> +static int nct6694_response_err_handling(struct nct6694 *nct6694,
> +					 unsigned char err_status)
> +{
> +	switch (err_status) {
> +	case NCT6694_NO_ERROR:
> +		return 0;
> +	case NCT6694_NOT_SUPPORT_ERROR:
> +		dev_err(nct6694->dev, "Command is not supported!\n");
> +		break;
> +	case NCT6694_NO_RESPONSE_ERROR:
> +		dev_warn(nct6694->dev, "Command received no response!\n");
> +		break;
> +	case NCT6694_TIMEOUT_ERROR:
> +		dev_warn(nct6694->dev, "Command timed out!\n");
> +		break;
> +	case NCT6694_PENDING:
> +		dev_err(nct6694->dev, "Command is pending!\n");
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	return -EIO;
> +}
> +

Missing Kconfig. Exported functions are supposed to have it.

> +int nct6694_read_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *cmd_hd, void *buf)
> +{
> +	union nct6694_usb_msg *msg = nct6694->usb_msg;
> +	struct usb_device *udev = nct6694->udev;
> +	int tx_len, rx_len, ret;
> +
> +	guard(mutex)(&nct6694->access_lock);
> +
> +	memcpy(&msg->cmd_header, cmd_hd, sizeof(*cmd_hd));
> +	msg->cmd_header.hctrl = NCT6694_HCTRL_GET;
> +
> +	/* Send command packet to USB device */
> +	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, NCT6694_BULK_OUT_EP), &msg->cmd_header,
> +			   sizeof(*msg), &tx_len, NCT6694_URB_TIMEOUT);
> +	if (ret)
> +		return ret;
> +
> +	/* Receive response packet from USB device */
> +	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), &msg->response_header,
> +			   sizeof(*msg), &rx_len, NCT6694_URB_TIMEOUT);
> +	if (ret)
> +		return ret;
> +
> +	/* Receive data packet from USB device */
> +	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), buf,
> +			   le16_to_cpu(cmd_hd->len), &rx_len, NCT6694_URB_TIMEOUT);
> +	if (ret)
> +		return ret;
> +
> +	if (rx_len != le16_to_cpu(cmd_hd->len)) {
> +		dev_err(nct6694->dev, "Expected received length %d, but got %d\n",
> +			le16_to_cpu(cmd_hd->len), rx_len);
> +		return -EIO;
> +	}
> +
> +	return nct6694_response_err_handling(nct6694, msg->response_header.sts);
> +}
> +EXPORT_SYMBOL(nct6694_read_msg);

GPL

> +
> +int nct6694_write_msg(struct nct6694 *nct6694, const struct nct6694_cmd_header *cmd_hd, void *buf)
> +{
> +	union nct6694_usb_msg *msg = nct6694->usb_msg;
> +	struct usb_device *udev = nct6694->udev;
> +	int tx_len, rx_len, ret;
> +
> +	guard(mutex)(&nct6694->access_lock);
> +
> +	memcpy(&msg->cmd_header, cmd_hd, sizeof(*cmd_hd));
> +	msg->cmd_header.hctrl = NCT6694_HCTRL_SET;
> +
> +	/* Send command packet to USB device */
> +	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, NCT6694_BULK_OUT_EP), &msg->cmd_header,
> +			   sizeof(*msg), &tx_len, NCT6694_URB_TIMEOUT);
> +	if (ret)
> +		return ret;
> +
> +	/* Send data packet to USB device */
> +	ret = usb_bulk_msg(udev, usb_sndbulkpipe(udev, NCT6694_BULK_OUT_EP), buf,
> +			   le16_to_cpu(cmd_hd->len), &tx_len, NCT6694_URB_TIMEOUT);
> +	if (ret)
> +		return ret;
> +
> +	/* Receive response packet from USB device */
> +	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), &msg->response_header,
> +			   sizeof(*msg), &rx_len, NCT6694_URB_TIMEOUT);
> +	if (ret)
> +		return ret;
> +
> +	/* Receive data packet from USB device */
> +	ret = usb_bulk_msg(udev, usb_rcvbulkpipe(udev, NCT6694_BULK_IN_EP), buf,
> +			   le16_to_cpu(cmd_hd->len), &rx_len, NCT6694_URB_TIMEOUT);
> +	if (ret)
> +		return ret;
> +
> +	if (rx_len != le16_to_cpu(cmd_hd->len)) {
> +		dev_err(nct6694->dev, "Expected transmitted length %d, but got %d\n",
> +			le16_to_cpu(cmd_hd->len), rx_len);
> +		return -EIO;
> +	}
> +
> +	return nct6694_response_err_handling(nct6694, msg->response_header.sts);
> +}
> +EXPORT_SYMBOL(nct6694_write_msg);
> +

Same comments.

Best regards,
Krzysztof

