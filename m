Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 44AFC13298E
	for <lists+linux-i2c@lfdr.de>; Tue,  7 Jan 2020 16:03:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728279AbgAGPDc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 7 Jan 2020 10:03:32 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:47780 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728221AbgAGPDc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 7 Jan 2020 10:03:32 -0500
Received: from [109.168.11.45] (port=53380 helo=[192.168.101.73])
        by hostingweb31.netsons.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1ioqOI-00EwsP-0P; Tue, 07 Jan 2020 16:03:30 +0100
Subject: Re: [RFC PATCH 3/5] i2c: core: add function to request an alias
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Vladimir Zapolskiy <vz@mleia.com>
References: <20191231161400.1688-1-wsa+renesas@sang-engineering.com>
 <20191231161400.1688-4-wsa+renesas@sang-engineering.com>
 <20200101165515.GC6226@pendragon.ideasonboard.com>
 <e008939f-531d-f7dc-4c3c-937476213030@lucaceresoli.net>
 <20200102211327.GB1030@kunai>
 <cc2a10ab-9f05-2c61-3a37-0e5e0184e379@lucaceresoli.net>
 <20200103001056.GJ4843@pendragon.ideasonboard.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <b9394a6c-1268-7cf8-6c00-e914735bc268@lucaceresoli.net>
Date:   Tue, 7 Jan 2020 16:03:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200103001056.GJ4843@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Laurent,

On 03/01/20 01:10, Laurent Pinchart wrote:
> On Thu, Jan 02, 2020 at 11:27:57PM +0100, Luca Ceresoli wrote:
>> Hi Wolfram,
>>
>> On 02/01/20 22:13, Wolfram Sang wrote:
>>> Hi Luca,
>>>
>>>>> This looks quite inefficient, especially if the beginning of the range
>>>>> is populated with devices. Furthermore, I think there's a high risk of
>>>>> false negatives, as acquiring a free address and reprogramming the
>>>>> client to make use of it are separate operations.
>>>>
>>>> Right. Applying the alias could raise other errors, thus one would need
>>>> i2c_new_alias_device() to keep the alias locked until programming it has
>>>> either failed or has been successfully programmed.
>>>
>>> Please see my reply to Laurent, I don't think it is racy. But please
>>> elaborate if you think I am wrong.
>>
>> Uhm, you are right here, it's not racy. Sorry, I had read the code
>> quickly and didn't notice the i2c_new_dummy_device() call.
>>
>> So this means if i2c_new_alias_device() succeeds but the caller later
>> fails while applying the alias, then it has to call
>> i2c_unregister_device() to free the alias. Correct?
> 
> I was wrong as well, sorry about that.
> 
>>>>> What happened to the idea of reporting busy address ranges in the
>>>>> firmware (DT, ACPI, ...) ?
>>>>
>>>> Indeed that's how I remember it as well, and I'm a bit suspicious about
>>>> sending out probe messages that might have side effects (even if the
>>>> false negative issue mentioned by Laurent were solved). You know, I've
>>>> been taught to "expect the worse" :) so I'd like to better understand
>>>> what are the strong reasons in favor of probing, as well as the
>>>> potential side effects.
>>>
>>> As I said to Laurent, too, I think the risk that a bus is not fully
>>> described is higher than a device which does not respond to a read_byte.
>>> In both cases, we would wrongly use an address in use.
> 
> I don't fully agree with this, I think we shouldn't impose a penalty on
> every user because some device trees don't fully describe the hardware.
> I think we should, at the very least, skip the probe and rely on DT if
> DT explicitly states that all used addresses are listed. We discussed a
> property to report addresses used by devices not described in DT, if
> that property is listed I would prefer trusting DT.

It would be nice, but I'm not sure this is really doable. Say the DT for
board X lists all the used slave addresses. Then the kernel would assume
all the other addresses are available. But then somebody includes the DT
of board X in the DT for product Z, based on board X + add-on board Y.
Add-on board Y has 2 I2C chips, but only one is described in DT. Now the
kernel still thinks it knows all the used address, but this is wrong.

At my current pondering status, I think only two approaches are doable:
either assuming all DTs fully describe the hardware (which is still a
good goal to pursue, generally speaking) or use Wolfram's proposal. The
difference between the two is the call to i2c_unlocked_read_byte_probe().

However a hybrid approach is to speak out loud if we get a response from
an address that is not marked as busy, to invite the developers to fix
their DT. In other words:

 ret = i2c_scan_for_client(adap, addr, i2c_unlocked_read_byte_probe);
 if (ret == -ENODEV) {
         alias = i2c_new_dummy_device(adap, addr);
         dev_dbg(&adap->dev, "Found alias: 0x%x\n", addr);
         break;
+} else if (ret == 0) {
+        dev_err(&adap->dev,
+                "alien found at %02x, please add it to your DT!!!\n",
+                addr);
 }

Wolfram, do think this could work? Do we have all the addresses listed
in DT marked as busy early enough?

-- 
Luca
