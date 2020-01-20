Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B0B6C143387
	for <lists+linux-i2c@lfdr.de>; Mon, 20 Jan 2020 22:54:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbgATVyK convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Mon, 20 Jan 2020 16:54:10 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:36509 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726752AbgATVyJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 20 Jan 2020 16:54:09 -0500
Received: from [212.124.162.70] (port=49808 helo=[192.168.77.51])
        by hostingweb31.netsons.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1itezm-000CuJ-GG; Mon, 20 Jan 2020 22:54:06 +0100
From:   Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [PATCH 02/26] docs: i2c: summary: extend introduction
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
References: <20200105224006.10321-1-luca@lucaceresoli.net>
 <20200105225012.11701-1-luca@lucaceresoli.net>
 <20200105225012.11701-2-luca@lucaceresoli.net>
 <20200120102730.4eb9116b@endymion>
Message-ID: <4a772de1-cb81-37bb-4170-9d19d56aaaac@lucaceresoli.net>
Date:   Mon, 20 Jan 2020 22:54:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200120102730.4eb9116b@endymion>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8BIT
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

Hi Jean,

On 20/01/20 10:27, Jean Delvare wrote:
> On Sun,  5 Jan 2020 23:49:48 +0100, Luca Ceresoli wrote:
>> - state the "official" name (I²C, not I2C, according to the spec) at
>>    the beginning but keep using the more practical I2C elsewhere
>>  - mention some known different names
>>  - add link to the specification document
> 
> Indentation is inconsistent.

Weird, this looks OK in my git log and my inbox, wrong on patchwork.
Perhaps starting an e-mail with a space breaks something? I'll try to
avoid that in the future.

>> diff --git a/Documentation/i2c/summary.rst b/Documentation/i2c/summary.rst
>> index 3a24eac17375..b7d3e620155b 100644
>> --- a/Documentation/i2c/summary.rst
>> +++ b/Documentation/i2c/summary.rst
>> @@ -2,12 +2,18 @@
>>  I2C and SMBus
>>  =============
>>  
>> -I2C (pronounce: I squared C) is a protocol developed by Philips. It is a
>> -slow two-wire protocol (variable speed, up to 400 kHz), with a high speed
>> -extension (3.4 MHz).  It provides an inexpensive bus for connecting many
>> -types of devices with infrequent or low bandwidth communications needs.
>> -I2C is widely used with embedded systems.  Some systems use variants that
>> -don't meet branding requirements, and so are not advertised as being I2C.
>> +I²C (pronounce: I squared C and written I2C in the kernel documentation) is
>> +a protocol developed by Philips. It is a slow two-wire protocol (variable
>> +speed, up to 400 kHz), with a high speed extension (3.4 MHz).  It provides
>> +an inexpensive bus for connecting many types of devices with infrequent or
>> +low bandwidth communications needs.  I2C is widely used with embedded
>> +systems.  Some systems use variants that don't meet branding requirements,
>> +and so are not advertised as being I2C but with different names, e.g. TWI
>> +(Two Wire Interface), IIC.
> 
> Maybe that's just me but "but with different names" sounds strange to
> me in the sentence construct. Maybe "but come under different names"
> instead?

What I mean is "...are not advertised as being I2C but [are advertised]
with different names". Looks equally clear to me, but since it has to be
clear to readers, I'll take your suggestion for v2.

Thanks for all the review work. I'm not going to reply to each e-mail
individually, but each of your suggestions will be taken in v2 unless I
reply differently.

-- 
Luca

