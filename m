Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 705AE123490
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Dec 2019 19:17:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727843AbfLQSRa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Dec 2019 13:17:30 -0500
Received: from mail.bugwerft.de ([46.23.86.59]:41202 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726722AbfLQSRa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Dec 2019 13:17:30 -0500
Received: from [192.168.178.106] (pD95EF574.dip0.t-ipconnect.de [217.94.245.116])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 6E681281A97;
        Tue, 17 Dec 2019 18:11:03 +0000 (UTC)
Subject: Re: [PATCH 07/10] i2c: Add driver for AD242x bus controller
To:     Luca Ceresoli <luca@lucaceresoli.net>,
        Wolfram Sang <wsa@the-dreams.de>
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
 <482316ef-775a-cb7b-015e-e00463503e6b@zonque.org>
 <4f2e1332-eac3-e54d-5de8-b84a76cb1a34@lucaceresoli.net>
From:   Daniel Mack <daniel@zonque.org>
Message-ID: <a55f7642-3ea1-e762-b5fc-8ff10b83ccc7@zonque.org>
Date:   Tue, 17 Dec 2019 19:17:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <4f2e1332-eac3-e54d-5de8-b84a76cb1a34@lucaceresoli.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Luca,

On 12/17/19 9:35 AM, Luca Ceresoli wrote:
> On 15/12/19 21:27, Daniel Mack wrote:

>> The a2b code has to tell the 'master node' the final destination of the
>> payload by programming registers on its primary i2c address, and then
>> forwards the messages to its secondary i2c address. The layout of the
>> messages don't change, and neither do the flags; i2c messages are being
>> sent as i2c messages, except their addresses are changed, a bit like NAT
>> in networking. That procedure is described on page 3-4 of the TRM,
>> "Remote Peripheral I2C Accesses".
>>
>> The 'real' i2c master that handles the hardware bus is responsible for
>> adding start conditions, and as the messages as such are untouched, I
>> believe it should do the right thing. The code in my xfer functions
>> merely suppresses reprogramming remote addresses by remembering the last
>> one that was used, but that is independent of the start conditions on
>> the wire.
> 
> My concern is not about the start condition, it's about the *repeated*
> start condition.
> 
> The first question is whether the A2B chips can do it. What if the host
> processor sets a slave chip address and then issues two messages
> separated by a repeated start condition? Will the slave transceiver emit
> a repeated start condition too?

Ah, alright. Thanks for taking the time to explain. I'll have to do some 
measurements with a hardware analyzer. Will revisit this then, and 
either provide an implementation that handles such cases correctly, or a 
comment to explain that the hardware can't do it.


Best regards,
Daniel
