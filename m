Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CA3CBFC283
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2019 10:23:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725976AbfKNJXg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Nov 2019 04:23:36 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:40426 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726010AbfKNJXg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 14 Nov 2019 04:23:36 -0500
Received: from [109.168.11.45] (port=58534 helo=[192.168.101.73])
        by hostingweb31.netsons.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1iVBLh-001jwO-8H; Thu, 14 Nov 2019 10:23:33 +0100
Subject: Re: [PATCH v3 2/3] i2c: smbus: use get/put_unaligned_le16 when
 working with word data
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-iio@vger.kernel.orgi,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20191112203132.163306-1-dmitry.torokhov@gmail.com>
 <20191112203132.163306-3-dmitry.torokhov@gmail.com>
 <099e8f9c-354a-8756-a79b-e66c72d36aa7@lucaceresoli.net>
 <20191113193937.GQ13374@dtor-ws>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <5f276a2a-4863-c81c-247f-686935b6c571@lucaceresoli.net>
Date:   Thu, 14 Nov 2019 10:23:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191113193937.GQ13374@dtor-ws>
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

Hi Dmitry,

On 13/11/19 20:39, Dmitry Torokhov wrote:
> Hi Luca,
> 
> On Wed, Nov 13, 2019 at 10:47:42AM +0100, Luca Ceresoli wrote:
>> Hi Dmitry,
>>
>> On 12/11/19 21:31, Dmitry Torokhov wrote:
>>> It is potentially more performant, and also shows intent more clearly,
>>> to use get_unaligned_le16() and put_unaligned_le16() when working with
>>> word data.
>>>
>>> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
>>>
>>> ---
>>>
>>> Changes in v3:
>>> - split put_unaligned_le16 into a separate patch
>>> - more call sites converted to get/put_unaligned_le16
>>>
>>>  drivers/i2c/i2c-core-smbus.c | 12 +++++-------
>>>  1 file changed, 5 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
>>> index f8708409b4dbc..7b4e2270eeda1 100644
>>> --- a/drivers/i2c/i2c-core-smbus.c
>>> +++ b/drivers/i2c/i2c-core-smbus.c
>>> @@ -15,6 +15,7 @@
>>>  #include <linux/i2c.h>
>>>  #include <linux/i2c-smbus.h>
>>>  #include <linux/slab.h>
>>> +#include <asm/unaligned.h>
>>>  
>>>  #include "i2c-core.h"
>>>  
>>> @@ -370,8 +371,7 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
>>>  			msg[1].len = 2;
>>>  		else {
>>>  			msg[0].len = 3;
>>> -			msgbuf0[1] = data->word & 0xff;
>>> -			msgbuf0[2] = data->word >> 8;
>>> +			put_unaligned_le16(data->word, msgbuf0 + 1);
>>>  		}
>>>  		break;
>>>  	case I2C_SMBUS_PROC_CALL:
>>> @@ -379,8 +379,7 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
>>>  		read_write = I2C_SMBUS_READ;
>>>  		msg[0].len = 3;
>>>  		msg[1].len = 2;
>>> -		msgbuf0[1] = data->word & 0xff;
>>> -		msgbuf0[2] = data->word >> 8;
>>> +		put_unaligned_le16(data->word, msgbuf0 + 1);
>>>  		break;
>>>  	case I2C_SMBUS_BLOCK_DATA:
>>>  		if (read_write == I2C_SMBUS_READ) {
>>> @@ -487,7 +486,7 @@ static s32 i2c_smbus_xfer_emulated(struct i2c_adapter *adapter, u16 addr,
>>>  			break;
>>>  		case I2C_SMBUS_WORD_DATA:
>>>  		case I2C_SMBUS_PROC_CALL:
>>> -			data->word = msgbuf1[0] | (msgbuf1[1] << 8);
>>> +			data->word = get_unaligned_le16(msgbuf1);
>>
>> Well, msgbuf1 cannot be unaligned, so it looks like you just need to
>> convert little endian to host endian. Perhaps __le16_to_cpu(msgbuf1) is
>> better (and equally or more efficient).
> 
> Well, msgbuf1 (as is any other variable unless adjusted by special
> alignment attribute) is naturally aligned for its own data type (which
> for u8 means it can start at any address), but that does not mean that
> is is aligned for the purpose of storing word data. In fact, the
> preceding msgbuf0 variable is 32 + 3 = 35 bytes long, which means that
> msgbuf1 is starting on an odd address, and is definitely not aligned for
> word access and using __le16_to_cpu to fetch that word will trap on some
> architectures.

Uhm, you're obviously right. And I was probably drunk when I wrote the
opposite! Sorry about that...

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
