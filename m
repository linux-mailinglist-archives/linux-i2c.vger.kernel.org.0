Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 087DF47987C
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Dec 2021 04:39:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230216AbhLRDjQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 22:39:16 -0500
Received: from marcansoft.com ([212.63.210.85]:35422 "EHLO mail.marcansoft.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230052AbhLRDjQ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 17 Dec 2021 22:39:16 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id 17B4841E96;
        Sat, 18 Dec 2021 03:39:12 +0000 (UTC)
Subject: Re: [External] Re: [PATCH v3] i2c: i801: Safely share SMBus with
 BIOS/ACPI
To:     Alex Henrie <alexh@vpitech.com>
Cc:     linux-i2c@vger.kernel.org, wsa@kernel.org, jdelvare@suse.de,
        alexhenrie24@gmail.com
References: <20211216173110.82ae177385322c0992d00126@vpitech.com>
 <a5da4d27-f2cc-9018-5266-9f40d74818ad@marcan.st>
 <20211217195128.49285f55facfe061655a6279@vpitech.com>
From:   Hector Martin <marcan@marcan.st>
Message-ID: <7fb63895-e8fb-c9c3-c5da-f922ae0c69fd@marcan.st>
Date:   Sat, 18 Dec 2021 12:39:11 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211217195128.49285f55facfe061655a6279@vpitech.com>
Content-Type: text/plain; charset=utf-8
Content-Language: es-ES
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 18/12/2021 11.51, Alex Henrie wrote:
> On Fri, 17 Dec 2021 16:41:05 +0900
> Hector Martin <marcan@marcan.st> wrote:
> 
>> On 17/12/2021 09.31, Alex Henrie wrote:
>>> I am having a similar problem, but unfortunately this patch doesn't
>>> work for me (I get the error "BIOS uses SMBus unsafely"). Would it be
>>> acceptable to add a module parameter to allow access to the SMBus, even
>>> if the BIOS is using it? I realize that this is not a good idea in
>>> general, but I believe it is safe in my particular case, and I don't
>>> see any other way to solve my problem.
>>
>> How is this safe in your case? If the BIOS is using SMBus without
>> locking it, and may do so at any time, then there's no way to safely use
>> it from Linux.
> 
> The BIOS appears to access the SMBus during the first few minutes after
> boot, and then it stops using it. So "safe" may not be the right word,
> but in my case, it seems to work OK to use the SMBus as long as the
> uptime is greater than a few minutes.
> 
> -Alex
> 

Linux will probe the SMBus on startup, so that still seems like a rather
fragile situation. You'd have to blacklist the module and load it
separately a few minutes after boot, or something like that...

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
