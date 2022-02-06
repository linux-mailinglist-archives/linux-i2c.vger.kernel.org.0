Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 37D314AAFE7
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Feb 2022 15:17:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242092AbiBFORR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 6 Feb 2022 09:17:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233178AbiBFORQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 6 Feb 2022 09:17:16 -0500
Received: from mail.marcansoft.com (marcansoft.com [IPv6:2a01:298:fe:f::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E2F1C06173B;
        Sun,  6 Feb 2022 06:17:13 -0800 (PST)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: marcan@marcan.st)
        by mail.marcansoft.com (Postfix) with ESMTPSA id 5D7774254F;
        Sun,  6 Feb 2022 14:17:03 +0000 (UTC)
Subject: Re: [PATCH v2] i2c: pasemi: Drop I2C classes from platform driver
 variant
To:     =?UTF-8?Q?Martin_Povi=c5=a1er?= <povik+lin@cutebit.org>,
        Sven Peter <sven@svenpeter.dev>,
        Michael Ellerman <mpe@ellerman.id.au>
Cc:     Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220204095914.5678-1-povik+lin@cutebit.org>
From:   Hector Martin <marcan@marcan.st>
Message-ID: <4884be12-e4e8-1b75-ee1b-3a8dc20bf342@marcan.st>
Date:   Sun, 6 Feb 2022 23:17:00 +0900
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220204095914.5678-1-povik+lin@cutebit.org>
Content-Type: text/plain; charset=utf-8
Content-Language: es-ES
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 04/02/2022 18.59, Martin Povišer wrote:
> Drop I2C device-probing classes from platform variant of the PASemi
> controller as it is only used on platforms where I2C devices should
> be instantiated in devicetree. (The I2C_CLASS_DEPRECATED flag is not
> raised as up to this point no devices relied on the old behavior.)
> 
> Fixes: d88ae2932df0 ("i2c: pasemi: Add Apple platform driver")
> Signed-off-by: Martin Povišer <povik+lin@cutebit.org>

Acked-by: Hector Martin <marcan@marcan.st>

Heh, so that's where this was... I remember running into this and
wondering if there was a way to turn it off.

-- 
Hector Martin (marcan@marcan.st)
Public Key: https://mrcn.st/pub
