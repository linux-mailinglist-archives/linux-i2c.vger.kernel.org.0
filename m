Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6000413D80F
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jan 2020 11:40:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726018AbgAPKiX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 16 Jan 2020 05:38:23 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:35416 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725800AbgAPKiX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 16 Jan 2020 05:38:23 -0500
Received: from [109.168.11.45] (port=50858 helo=[192.168.101.73])
        by hostingweb31.netsons.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1is2Xb-00053Y-OV; Thu, 16 Jan 2020 11:38:20 +0100
Subject: Re: [PATCH 26/26] docs: i2c: rename sections so the overall picture
 is clearer
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wolfram Sang <wsa@the-dreams.de>,
        Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
References: <20200105224006.10321-1-luca@lucaceresoli.net>
 <20200106074905.14438-1-luca@lucaceresoli.net>
 <20200116104907.3f2de4d0@endymion>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <7809c0c2-1d83-cc95-b258-644ea8315f86@lucaceresoli.net>
Date:   Thu, 16 Jan 2020 11:38:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200116104907.3f2de4d0@endymion>
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

Hi Jean, Peter,

thanks both for your reviews.

On 16/01/20 10:49, Jean Delvare wrote:
> On Mon,  6 Jan 2020 08:49:05 +0100, Luca Ceresoli wrote:
>> Some of the section names are not very clear. Reading those names in the
>> index.rst page does not help much in grasping what the content is supposed
>> to be.
>>
>> Rename those sections to clarify their content, especially when reading
>> the index page.
>>
>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>> Acked-by: Peter Rosin <peda@axentia.se>
>> ---
>>
>> Note: here checkpatch complains:
>>
>>   WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
>>
>> Thas's because those files have no license line. I would gladly add a
>> proper license line, but what it the correct license here? Should I ask the
>> authors? GPLv2-only as the kernel default?
>>
>> I'd appreciate a guidance here, thanks in advance.
> 
> I don't think we need a license for such documentation files, so I
> would just ignore checkpatch.

That's OK for me.

>> diff --git a/Documentation/i2c/summary.rst b/Documentation/i2c/summary.rst
>> index fc69d9567d9d..ae3bbb9fd8f1 100644
>> --- a/Documentation/i2c/summary.rst
>> +++ b/Documentation/i2c/summary.rst
>> @@ -1,6 +1,6 @@
>> -=============
>> -I2C and SMBus
>> -=============
>> +==============================
>> +Introductions to I2C and SMBus
>> +==============================
> 
> I would use "Introduction", singular.

Me too! Fix queued for v2.

Peter, I assume I can keep your Acked-by in v2 with this small change.

-- 
Luca
