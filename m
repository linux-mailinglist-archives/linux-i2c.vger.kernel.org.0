Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 688D34785AD
	for <lists+linux-i2c@lfdr.de>; Fri, 17 Dec 2021 08:41:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233751AbhLQHlO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 17 Dec 2021 02:41:14 -0500
Received: from marcansoft.com ([212.63.210.85]:51190 "EHLO mail.marcansoft.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229725AbhLQHlN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 17 Dec 2021 02:41:13 -0500
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id 5D19C42165;
        Fri, 17 Dec 2021 07:41:08 +0000 (UTC)
Subject: Re: [PATCH v3] i2c: i801: Safely share SMBus with BIOS/ACPI
To:     Alex Henrie <alexh@vpitech.com>, linux-i2c@vger.kernel.org,
        wsa@kernel.org, jdelvare@suse.de
Cc:     alexhenrie24@gmail.com
References: <20211216173110.82ae177385322c0992d00126@vpitech.com>
From:   Hector Martin <marcan@marcan.st>
Message-ID: <a5da4d27-f2cc-9018-5266-9f40d74818ad@marcan.st>
Date:   Fri, 17 Dec 2021 16:41:05 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211216173110.82ae177385322c0992d00126@vpitech.com>
Content-Type: text/plain; charset=utf-8
Content-Language: es-ES
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 17/12/2021 09.31, Alex Henrie wrote:
> Dear kernel developers,
> 
> I am having a similar problem, but unfortunately this patch doesn't
> work for me (I get the error "BIOS uses SMBus unsafely"). Would it be
> acceptable to add a module parameter to allow access to the SMBus, even
> if the BIOS is using it? I realize that this is not a good idea in
> general, but I believe it is safe in my particular case, and I don't
> see any other way to solve my problem.
> 
> -Alex
> 

How is this safe in your case? If the BIOS is using SMBus without
locking it, and may do so at any time, then there's no way to safely use
it from Linux.

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
