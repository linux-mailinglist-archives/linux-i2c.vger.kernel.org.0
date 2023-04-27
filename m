Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8CB456F0682
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Apr 2023 15:18:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243511AbjD0NSp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Apr 2023 09:18:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243389AbjD0NSo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Apr 2023 09:18:44 -0400
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D88EE3A9D;
        Thu, 27 Apr 2023 06:18:41 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33RDILEE008704;
        Thu, 27 Apr 2023 08:18:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1682601501;
        bh=aRPkmFjPUUIdQsoTSyqu9OgRtqLJfO1ZLksP2GoJu3A=;
        h=Date:Subject:To:CC:References:From:In-Reply-To;
        b=EkJgaVenU9sKNTssKD5ahQ7w8yhcneuKZINBe+gCqxfxXuD1PoRed1R2G6wzdf4Ix
         bExan/1NxiGAzZEOwBL8GTqgyu0LEaAXpbQRDFZsQq8iI1p21Zwq+7wI+kzv1/tLg+
         jXDGpivMgJZBqut+x6w3d1VhO/vQbFX2Vd9vJdJY=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33RDIL9r112314
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 27 Apr 2023 08:18:21 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 27
 Apr 2023 08:18:21 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 27 Apr 2023 08:18:21 -0500
Received: from [10.249.133.214] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33RDIIaS035130;
        Thu, 27 Apr 2023 08:18:19 -0500
Message-ID: <445b3cbf-ffbc-6f77-47db-c30fc599e88f@ti.com>
Date:   Thu, 27 Apr 2023 18:48:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2] i2c: omap: Fix standard mode false ACK readings
Content-Language: en-US
To:     Reid Tonking <reidt@ti.com>, <tony@atomide.com>,
        <aaro.koskinen@iki.fi>, <jmkrzyszt@gmail.com>
CC:     <linux-omap@vger.kernel.org>, <linux-i2c@vger.kernel.org>
References: <20230426194956.689756-1-reidt@ti.com>
From:   "Raghavendra, Vignesh" <vigneshr@ti.com>
In-Reply-To: <20230426194956.689756-1-reidt@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-6.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 4/27/2023 1:19 AM, Reid Tonking wrote:
> Using standard mode, rare false ACK responses were appearing with
> i2cdetect tool. This was happening due to NACK interrupt triggering
> ISR thread before register access interrupt was ready. Removing the
> NACK interrupt's ability to trigger ISR thread lets register access
> ready interrupt do this instead.
> 
> Cc: <stable@vger.kernel.org> # v3.7+
> Fixes: 3b2f8f82dad7 ("i2c: omap: switch to threaded IRQ support")
> Signed-off-by: Reid Tonking <reidt@ti.com>

Acked-by: Vignesh Raghavendra <vigneshr@ti.com>


Regards
Vignesh
