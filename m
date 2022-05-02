Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C757517934
	for <lists+linux-i2c@lfdr.de>; Mon,  2 May 2022 23:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379970AbiEBVkC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 2 May 2022 17:40:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1387716AbiEBVjn (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 2 May 2022 17:39:43 -0400
Received: from ssl.serverraum.org (ssl.serverraum.org [IPv6:2a01:4f8:151:8464::1:2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDB8AE0A4;
        Mon,  2 May 2022 14:36:09 -0700 (PDT)
Received: from ssl.serverraum.org (web.serverraum.org [172.16.0.2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ssl.serverraum.org (Postfix) with ESMTPSA id 3F88A221D4;
        Mon,  2 May 2022 23:36:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2016061301;
        t=1651527367;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NXiTU+OHkuDffifSh9UIXBSPftKavHLkehOxtPzIoyA=;
        b=dxUWftASJW8AAT8FM9QsPGbpk6LCEH7fYEEgcvCJecmWkLNSCECyPUaU9x4Icc5Ecx43QL
        vUuVvDK9fTxIvwfAMUB5GbPmubpr/THe7/050IOs0dh1g3U70gVHAjA2Fo7+66amWyq9Rq
        E0WyOM6pULx4OX57s/ia+vAaoKYH+8s=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 02 May 2022 23:36:06 +0200
From:   Michael Walle <michael@walle.cc>
To:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@microchip.com>, wsa@kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: at91: use dma safe buffers
In-Reply-To: <20220407150828.202513-1-michael@walle.cc>
References: <20220407150828.202513-1-michael@walle.cc>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <454e874e53bc5d15308a60bcef335d8c@walle.cc>
X-Sender: michael@walle.cc
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Am 2022-04-07 17:08, schrieb Michael Walle:
> The supplied buffer might be on the stack and we get the following 
> error
> message:
> [    3.312058] at91_i2c e0070600.i2c: rejecting DMA map of vmalloc 
> memory
> 
> Use i2c_{get,put}_dma_safe_msg_buf() to get a DMA-able memory region if
> necessary.
> 
> Fixes: 60937b2cdbf9 ("i2c: at91: add dma support")
> Signed-off-by: Michael Walle <michael@walle.cc>
> Reviewed-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>

Wolfgang, will you pick this one?

-michael
