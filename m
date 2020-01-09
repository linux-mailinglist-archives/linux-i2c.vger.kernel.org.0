Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B27D013631D
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2020 23:15:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725919AbgAIWPf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Jan 2020 17:15:35 -0500
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:55537 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725840AbgAIWPf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Jan 2020 17:15:35 -0500
Received: from [88.149.160.229] (port=59042 helo=[192.168.77.51])
        by hostingweb31.netsons.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.92)
        (envelope-from <luca@lucaceresoli.net>)
        id 1ipg5U-003Orv-BB; Thu, 09 Jan 2020 23:15:32 +0100
Subject: Re: [PATCH v2] docs: i2c: Fix return value of i2c_smbus_xxx functions
To:     Jean Delvare <jdelvare@suse.de>, Wolfram Sang <wsa@the-dreams.de>
Cc:     Lei YU <mine260309@gmail.com>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1574162632-65848-1-git-send-email-mine260309@gmail.com>
 <20191125144857.GA2412@kunai> <20191126115243.673fc164@endymion>
 <20200106130056.GA1290@ninjato> <20200109173929.1b42e0a6@endymion>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <0bf8bf55-525f-fd4e-0f10-fe0efad9ecb2@lucaceresoli.net>
Date:   Thu, 9 Jan 2020 23:15:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200109173929.1b42e0a6@endymion>
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

Hi Jean,

On 09/01/20 17:39, Jean Delvare wrote:
> On Mon, 6 Jan 2020 14:01:09 +0100, Wolfram Sang wrote:
>>> I would go further and move half of the document to i2c-tools. i2c-dev
>>> itself only provides the ioctls. Everything on top of that is in libi2c
>>> now, so the kernel documentation should point to libi2c and the
>>> detailed documentation should come with libi2c.
>>>
>>> So I guess I should review the whole document now to see what needs to
>>> be updated, what should stay, and what should move.  
>>
>> Maybe you can collaborate with Luca on this who just revamped a lot of
>> the docs? Putting him on CC and marking this patch as 'Deferred'.
> 
> I'm resuming my work on this. Luca, can you point me to your changes to
> Documentation/i2c/dev-interface.rst so that I can adjust my own changes
> to fit on top?

Commits 4 and 26 of this series:

https://patchwork.ozlabs.org/project/linux-i2c/list/?series=151292

Pretty trivial patches anyway, I haven't really tackled that specific
file so far, which is good as you are planning to remove all/most of it.

-- 
Luca
