Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EE0E2287D6
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Jul 2020 19:58:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728992AbgGUR4k (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Jul 2020 13:56:40 -0400
Received: from smtp.al2klimov.de ([78.46.175.9]:33802 "EHLO smtp.al2klimov.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728387AbgGUR4k (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 21 Jul 2020 13:56:40 -0400
Received: from authenticated-user (PRIMARY_HOSTNAME [PUBLIC_IP])
        by smtp.al2klimov.de (Postfix) with ESMTPA id 506D6BC148;
        Tue, 21 Jul 2020 17:56:37 +0000 (UTC)
Subject: Re: [PATCH for v5.9] i2c: Replace HTTP links with HTTPS ones
To:     Jean Delvare <jdelvare@suse.de>
Cc:     wsa@kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200719193553.61319-1-grandmaster@al2klimov.de>
 <20200721115029.5669984b@endymion>
From:   "Alexander A. Klimov" <grandmaster@al2klimov.de>
Message-ID: <b7cfd6e3-ee79-b7e2-c7f9-a58e960c3a88@al2klimov.de>
Date:   Tue, 21 Jul 2020 19:56:36 +0200
MIME-Version: 1.0
In-Reply-To: <20200721115029.5669984b@endymion>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp.al2klimov.de;
        auth=pass smtp.auth=aklimov@al2klimov.de smtp.mailfrom=grandmaster@al2klimov.de
X-Spamd-Bar: /
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



Am 21.07.20 um 11:50 schrieb Jean Delvare:
> Hi Alexander,
> 
> On Sun, 19 Jul 2020 21:35:53 +0200, Alexander A. Klimov wrote:
>> Rationale:
>> Reduces attack surface on kernel devs opening the links for MITM
>> as HTTPS traffic is much harder to manipulate.
>> (...)
>>   Documentation/i2c/busses/i2c-ali1535.rst | 2 +-
>>   Documentation/i2c/busses/i2c-ali15x3.rst | 2 +-
>>   Documentation/i2c/busses/i2c-piix4.rst   | 4 ++--
>>   drivers/i2c/busses/i2c-ali1535.c         | 2 +-
>>   drivers/i2c/busses/i2c-ali15x3.c         | 2 +-
>>   5 files changed, 6 insertions(+), 6 deletions(-)
> 
> The diffstat above does not match the changes below (specifically
> i2c-piix4.rst is NOT modified by your actual patch).
Yes, I've chosen "the easy way" of git commit --amend:
Editing the patch file.
I this a problem?

> 
>> diff --git a/Documentation/i2c/busses/i2c-ali1535.rst b/Documentation/i2c/busses/i2c-ali1535.rst
>> index 6941064730dc..3fe2bad63597 100644
>> --- a/Documentation/i2c/busses/i2c-ali1535.rst
>> +++ b/Documentation/i2c/busses/i2c-ali1535.rst
>> @@ -28,7 +28,7 @@ Additionally, the sequencing of the SMBus transactions has been modified to
>>   be more consistent with the sequencing recommended by the manufacturer and
>>   observed through testing.  These changes are reflected in this driver and
>>   can be identified by comparing this driver to the i2c-ali15x3 driver. For
>> -an overview of these chips see http://www.acerlabs.com
>> +an overview of these chips see https://www.acerlabs.com
>> (...)
> 
> A quick visit to this website shows that it is dead and useless. The
> closest thing nowadays would be https://www.ali.com.tw/ however as far
> as I know ALI sold their x86 chipset business to Nvidia in 2006. I
> couldn't find information about these old chipsets on either website
> though, so I believe that the best course of action would be to strip
> the links and surrounding sentences.
I don't agree with you.
IMAO broken links should be archive.org-ed.
I've added that to my todo list.

> 
> I understand this is beyond the scope of your current project. Do you
> want me to take care of that?
> 
