Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 80E0511FB0B
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Dec 2019 21:27:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726346AbfLOU1X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 15 Dec 2019 15:27:23 -0500
Received: from mail.bugwerft.de ([46.23.86.59]:51232 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726146AbfLOU1X (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 15 Dec 2019 15:27:23 -0500
Received: from [192.168.178.200] (p57BC9BBE.dip0.t-ipconnect.de [87.188.155.190])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 0143A2E79BE;
        Sun, 15 Dec 2019 20:20:57 +0000 (UTC)
Subject: Re: [PATCH 07/10] i2c: Add driver for AD242x bus controller
To:     Wolfram Sang <wsa@the-dreams.de>,
        Luca Ceresoli <luca@lucaceresoli.net>
Cc:     linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        broonie@kernel.org, lee.jones@linaro.org, lars@metafoo.de,
        pascal.huerst@gmail.com
References: <20191209183511.3576038-1-daniel@zonque.org>
 <20191209183511.3576038-9-daniel@zonque.org>
 <64adf5d7-754a-f1da-aa9b-11579c5a2780@lucaceresoli.net>
 <20191212163315.GA3932@kunai>
From:   Daniel Mack <daniel@zonque.org>
Autocrypt: addr=daniel@zonque.org; prefer-encrypt=mutual; keydata=
 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
Message-ID: <482316ef-775a-cb7b-015e-e00463503e6b@zonque.org>
Date:   Sun, 15 Dec 2019 21:27:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191212163315.GA3932@kunai>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

Thanks for the review!

On 12/12/2019 5:33 pm, Wolfram Sang wrote:
> Hi Luca,
> 
> thanks for the review!
> 
>> good, but I think there's a problem in this function. A "normal"
>> master_xfer function issues a repeated start between one msg and the
>> next one, at least in the typical case where all msgs have the same
>> slave address. Your implementation breaks repeated start. At first sight
>> we might need more complex code here to coalesce all consecutive msgs
>> with the same address into a single i2c_transfer() call.
> 
> Note that it is by far the standard case that all messages in a transfer
> have the same client address (99,999%?). But technically, this is not a
> requirement and the repeated start on the bus is totally independent of
> the addresses used. It is just a master wanting to send without being
> interrupted by another master.

I'm not quite sure I understand.

Let's assume the following setup. An i2c client (some driver code) is
sending a list of messages to the a2b xfer function, which in turn is
logically connected to a 'real' i2c bus master that'll put the data on
the wire.

The a2b code has to tell the 'master node' the final destination of the
payload by programming registers on its primary i2c address, and then
forwards the messages to its secondary i2c address. The layout of the
messages don't change, and neither do the flags; i2c messages are being
sent as i2c messages, except their addresses are changed, a bit like NAT
in networking. That procedure is described on page 3-4 of the TRM,
"Remote Peripheral I2C Accesses".

The 'real' i2c master that handles the hardware bus is responsible for
adding start conditions, and as the messages as such are untouched, I
believe it should do the right thing. The code in my xfer functions
merely suppresses reprogramming remote addresses by remembering the last
one that was used, but that is independent of the start conditions on
the wire.

Maybe I'm missing anything. Could you provide an example that explains
in which case this approach would leads to issues?


Thanks,
Daniel
