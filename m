Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DAEC214695F
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Jan 2020 14:42:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727307AbgAWNmg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 23 Jan 2020 08:42:36 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:51040 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726780AbgAWNmf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 23 Jan 2020 08:42:35 -0500
Received: from [109.168.11.45] (port=39406 helo=[192.168.101.73])
        by hostingweb31.netsons.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1iuckj-0008wR-HM; Thu, 23 Jan 2020 14:42:33 +0100
Subject: Re: [PATCH 2/2] docs: i2c: dev-interface: document the actual
 implementation
To:     Wolfram Sang <wsa@the-dreams.de>, Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Lei YU <mine260309@gmail.com>
References: <20200123105246.67732e33@endymion>
 <20200123111137.5899fa5a@endymion> <20200123110909.GG1105@ninjato>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <ffac66db-0b58-b832-f6b5-d1a1da7a1da9@lucaceresoli.net>
Date:   Thu, 23 Jan 2020 14:42:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200123110909.GG1105@ninjato>
Content-Type: text/plain; charset=windows-1252
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

Hi Jean, Wolfram,

On 23/01/20 12:09, Wolfram Sang wrote:
> On Thu, Jan 23, 2020 at 11:11:37AM +0100, Jean Delvare wrote:
>> The old i2c-dev API based on inline functions is long gone, we have
>> libi2c now which implements the same as real functions and comes with
>> complete API documentation. Update the dev-interface documentation
>> file accordingly to only mention what can be done without the
>> library, and redirect the reader to the libi2c manual page for the
>> rest.
>>
>> Signed-off-by: Jean Delvare <jdelvare@suse.de>
>> Reported-by: Lei YU <mine260309@gmail.com>
>> Cc: Wolfram Sang <wsa@the-dreams.de>
>> Cc: Luca Ceresoli <luca@lucaceresoli.net>
> 
> I wonder if we shouldn't move the 'C library'  paragraph before the 'C
> example'? To make sure people are aware of it (and use it) early before
> digging into the low-level C code?

I agree, it would be better. For the rest it look good.

-- 
Luca
