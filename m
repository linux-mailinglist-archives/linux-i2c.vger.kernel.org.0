Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2F7DB1226C6
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Dec 2019 09:36:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726710AbfLQIfq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Dec 2019 03:35:46 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:46783 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726520AbfLQIfp (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 17 Dec 2019 03:35:45 -0500
Received: from [37.163.141.23] (port=40521 helo=[192.168.43.3])
        by hostingweb31.netsons.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1ih8KT-0002cv-Fc; Tue, 17 Dec 2019 09:35:41 +0100
Subject: Re: [PATCH 07/10] i2c: Add driver for AD242x bus controller
To:     Daniel Mack <daniel@zonque.org>, Wolfram Sang <wsa@the-dreams.de>
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
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <4f2e1332-eac3-e54d-5de8-b84a76cb1a34@lucaceresoli.net>
Date:   Tue, 17 Dec 2019 09:35:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <482316ef-775a-cb7b-015e-e00463503e6b@zonque.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Daniel,

On 15/12/19 21:27, Daniel Mack wrote:
> Hi,
> 
> Thanks for the review!
> 
> On 12/12/2019 5:33 pm, Wolfram Sang wrote:
>> Hi Luca,
>>
>> thanks for the review!
>>
>>> good, but I think there's a problem in this function. A "normal"
>>> master_xfer function issues a repeated start between one msg and the
>>> next one, at least in the typical case where all msgs have the same
>>> slave address. Your implementation breaks repeated start. At first sight
>>> we might need more complex code here to coalesce all consecutive msgs
>>> with the same address into a single i2c_transfer() call.
>>
>> Note that it is by far the standard case that all messages in a transfer
>> have the same client address (99,999%?). But technically, this is not a
>> requirement and the repeated start on the bus is totally independent of
>> the addresses used. It is just a master wanting to send without being
>> interrupted by another master.
> 
> I'm not quite sure I understand.
> 
> Let's assume the following setup. An i2c client (some driver code) is
> sending a list of messages to the a2b xfer function, which in turn is
> logically connected to a 'real' i2c bus master that'll put the data on
> the wire.
> 
> The a2b code has to tell the 'master node' the final destination of the
> payload by programming registers on its primary i2c address, and then
> forwards the messages to its secondary i2c address. The layout of the
> messages don't change, and neither do the flags; i2c messages are being
> sent as i2c messages, except their addresses are changed, a bit like NAT
> in networking. That procedure is described on page 3-4 of the TRM,
> "Remote Peripheral I2C Accesses".
> 
> The 'real' i2c master that handles the hardware bus is responsible for
> adding start conditions, and as the messages as such are untouched, I
> believe it should do the right thing. The code in my xfer functions
> merely suppresses reprogramming remote addresses by remembering the last
> one that was used, but that is independent of the start conditions on
> the wire.

My concern is not about the start condition, it's about the *repeated*
start condition.

The first question is whether the A2B chips can do it. What if the host
processor sets a slave chip address and then issues two messages
separated by a repeated start condition? Will the slave transceiver emit
a repeated start condition too?

If the answer is "yes", then the issue moves to the driver code. A
master xfer function receives a set of messages that are normally
emitted with a repeated start between each other. But ad242x_i2c_xfer()
splits the msgs and calls i2c_transfer_buffer_flags() with one msg at a
time. i2c_transfer_buffer_flags() then will emit a stop condition.

This is not necessarily a problem, unless multi-master is used, but if
there are limitations or deviations from the standard they should at
least be well known and documented.

-- 
Luca
