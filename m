Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3F824A6C9F
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Feb 2022 09:07:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243012AbiBBIHT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Feb 2022 03:07:19 -0500
Received: from vps.xff.cz ([195.181.215.36]:38672 "EHLO vps.xff.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237918AbiBBIHT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 2 Feb 2022 03:07:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
        t=1643789237; bh=DMb83cDhQ9rKfuJDRxlbrgx/yp3Sg6TPsG7z/FqFLqM=;
        h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
        b=SMjCuZQl5MJHcizfaQRtdVjolGreh3bV4fJivIFWoZsfsEEKAP0D1DUyV4VoJ2iHq
         TBRUIYt2dJeggUIFbVk2gOghjgcQWHndb/PmwhQMSPnbf/pM+rmQGYtGhGGh0S9MSO
         8chZOfzkHoI3bOtbVWS2bYGKvi0zx/d8JSgV5TBE=
Date:   Wed, 2 Feb 2022 09:07:17 +0100
From:   =?utf-8?Q?Ond=C5=99ej?= Jirman <x@xff.cz>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH 2/5] Input: pinephone-keyboard - Add PinePhone keyboard
 driver
Message-ID: <20220202080717.fai74mkjxdykqhht@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <x@xff.cz>,
        Samuel Holland <samuel@sholland.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20220129230043.12422-1-samuel@sholland.org>
 <20220129230043.12422-3-samuel@sholland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220129230043.12422-3-samuel@sholland.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hello Samuel,

On Sat, Jan 29, 2022 at 05:00:39PM -0600, Samuel Holland wrote:
> The official Pine64 PinePhone keyboard case contains a matrix keypad and
> a MCU which runs a libre firmware. Add support for its I2C interface.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---

> [...]

> +
> +	ppkb->buf_swap = !ppkb->buf_swap;
> +
> +	keymap = ppkb->fn_state ? ppkb->fn_keymap : ppkb->input->keycode;
> +	for (col = 0; col < ppkb->cols; ++col) {
> +		u8 old = *(++old_buf);
> +		u8 new = *(++new_buf);
> +		u8 changed = old ^ new;
> +
> +		for (row = 0; row < ppkb->rows; ++row) {
> +			int code = MATRIX_SCAN_CODE(row, col, ppkb->row_shift);
> +			int value = new & BIT(row);
> +
> +			if (!(changed & BIT(row)))
> +				continue;
> +
> +			dev_dbg(dev, "row %u col %u %sed\n",
> +				row, col, value ? "press" : "releas");
> +			if (keymap[code] == KEY_FN) {
> +				dev_dbg(dev, "FN is now %sed\n",
> +					value ? "press" : "releas");
> +				keymap = value ? ppkb->fn_keymap
> +					       : ppkb->input->keycode;
> +				ppkb->fn_state = value;
> +			}
> +			input_event(ppkb->input, EV_MSC, MSC_SCAN, code);
> +			input_report_key(ppkb->input, keymap[code], value);

I think there's a logic issue here with the Fn layer. Consider what happens
when you press Fn press F1 and then release Fn and release F1. In that case
input_report_key will report press of F1 (in fn layer) but release of '1'
which is not in Fn layer, because Fn layer was de-activated before releasing
the modified key.

From the PoV of the user, this will probably lead to auto-repeat of F1 and
spurious '1' release without preceding press event. So the userspace sees
F1 as stuck and auto-repeats it.

kind regards,
	o.

> +		}
> +	}
> +	input_sync(ppkb->input);
> +}
> +
