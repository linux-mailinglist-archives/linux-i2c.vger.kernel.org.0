Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD5BF2752B5
	for <lists+linux-i2c@lfdr.de>; Wed, 23 Sep 2020 10:01:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbgIWIBQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 23 Sep 2020 04:01:16 -0400
Received: from pegase1.c-s.fr ([93.17.236.30]:50376 "EHLO pegase1.c-s.fr"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726130AbgIWIBQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 23 Sep 2020 04:01:16 -0400
Received: from localhost (mailhub1-int [192.168.12.234])
        by localhost (Postfix) with ESMTP id 4Bx9bq4QPjz9v09g;
        Wed, 23 Sep 2020 10:01:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
        by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
        with ESMTP id o-mWIuJAAecS; Wed, 23 Sep 2020 10:01:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
        by pegase1.c-s.fr (Postfix) with ESMTP id 4Bx9bq29Pnz9tx4Q;
        Wed, 23 Sep 2020 10:01:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id F1A5C8B7F4;
        Wed, 23 Sep 2020 10:01:11 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
        by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
        with ESMTP id yJFG8sUqnTVC; Wed, 23 Sep 2020 10:01:11 +0200 (CEST)
Received: from [10.25.210.27] (unknown [10.25.210.27])
        by messagerie.si.c-s.fr (Postfix) with ESMTP id 8777A8B7F1;
        Wed, 23 Sep 2020 10:01:11 +0200 (CEST)
Subject: Re: [PATCH] i2c: cpm: Fix i2c_ram structure
To:     Vincent Nicolas <Nicolas.Vincent@vossloh.com>,
        "jochen@scram.de" <jochen@scram.de>
Cc:     "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <20200922090400.6282-1-nicolas.vincent@vossloh.com>
 <956c4b63-f859-df0c-2836-80a988ee6aa9@csgroup.eu>
 <PR3P193MB0731945473A9F251C7F37608F1380@PR3P193MB0731.EURP193.PROD.OUTLOOK.COM>
From:   Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <2ecfe18a-61f6-bb0e-22c5-b7ab79a77d03@csgroup.eu>
Date:   Wed, 23 Sep 2020 10:01:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <PR3P193MB0731945473A9F251C7F37608F1380@PR3P193MB0731.EURP193.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



Le 23/09/2020 à 09:18, Vincent Nicolas a écrit :
> 
> 
> 
> From: Christophe Leroy <christophe.leroy@csgroup.eu>
> Sent: Tuesday, 22 September 2020 14:38
> To: Vincent Nicolas <Nicolas.Vincent@vossloh.com>; jochen@scram.de <jochen@scram.de>
> Cc: linuxppc-dev@lists.ozlabs.org <linuxppc-dev@lists.ozlabs.org>; linux-i2c@vger.kernel.org <linux-i2c@vger.kernel.org>
> Subject: Re: [PATCH] i2c: cpm: Fix i2c_ram structure
>   
> 
> 
> Le 22/09/2020 à 11:04, nico.vince@gmail.com a écrit :
>> From: Nicolas VINCENT <nicolas.vincent@vossloh.com>
>>
>> the i2c_ram structure is missing the sdmatmp field mentionned in
>> datasheet for MPC8272 at paragraph 36.5. With this field missing, the
>> hardware would write past the allocated memory done through
>> cpm_muram_alloc for the i2c_ram structure and land in memory allocated
>> for the buffers descriptors corrupting the cbd_bufaddr field. Since this
>> field is only set during setup(), the first i2c transaction would work
>> and the following would send data read from an arbitrary memory
>> location.
>>
>> Signed-off-by: Nicolas VINCENT <nicolas.vincent@vossloh.com>
>> ---
>>     drivers/i2c/busses/i2c-cpm.c | 3 ++-
>>     1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/i2c/busses/i2c-cpm.c b/drivers/i2c/busses/i2c-cpm.c
>> index 1213e1932ccb..c5700addbf65 100644
>> --- a/drivers/i2c/busses/i2c-cpm.c
>> +++ b/drivers/i2c/busses/i2c-cpm.c
>> @@ -64,7 +64,8 @@ struct i2c_ram {
>>          uint    txtmp;          /* Internal */
>>          char    res1[4];        /* Reserved */
>>          ushort  rpbase;         /* Relocation pointer */
>> -     char    res2[2];        /* Reserved */
>> +     char    res2[6];        /* Reserved */
>> +     uint    sdmatmp;        /* Internal */
> 
> On CPM1, I2C param RAM has size 0x30 (offset 0x1c80-0x1caf)
> 
> Your change overlaps the miscellaneous area that contains CP Microcode
> Revision Number, ref MPC885 Reference Manual §18.7.3
> 
> As far as I understand the mpc885 contains in the dts the compatible=fsl,cpm1-i2c which is used in cpm-i2c.c to either determine the address of the i2c_ram structure (cpm1), or dynamically allocate it with cpm_muram_alloc (cpm2).
> In the first case the structure will indeed overlaps with the miscellaneous section but since the sdmatmp is only used by cpm2 hardware it shall not be an issue.
> 
> Please, let me know if I am mistaken. If the patch cannot be accepted as is, I would gladly accept pointers on how to address this kind of issue.


Please use a mail client that properly sets the > in front of 
original/answered text. Here your mailer has mixed you text and mine, 
that's unusable on the long term.


I think you are right on the fact that it doesn't seem to be an issue. 
Nevertheless, that's confusing.

What I would suggest is to leave res2[2] as is, and add something like:

	/* The following elements are only for CPM2 */
	char res3[4];	/* Reserved */
	uint sdmatmp;	/* Internal */


Other solution (not sure that's the best solution thought) would be to 
do as in spi-fsl-cpm: use iic_t structure from asm/cpm1.h when 
CONFIG_CPM1 is selected and use iic_t from asm/cpm2.h when CONFIG_CPM2 
is selected, taking into account that CONFIG_CPM1 and CONFIG_CPM2 are 
mutually exclusive at the time being.

Christophe
