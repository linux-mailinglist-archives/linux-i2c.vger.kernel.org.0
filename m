Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 656586F1E10
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Apr 2023 20:31:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229648AbjD1SbM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Apr 2023 14:31:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346482AbjD1SbL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Apr 2023 14:31:11 -0400
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C751100;
        Fri, 28 Apr 2023 11:31:10 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 33SIUc6Z055315;
        Fri, 28 Apr 2023 13:30:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1682706638;
        bh=xa1wxAxDRpJzcZXZhnN0JxvWNfHwGu9zSRjLj4uZ8b4=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=jMLRCAAmrBoZ3hwBQgGAco+MO5cCbzTHIrVJwv2BQKmj/wR8CAjVpH7VRMdtNnQ/J
         PUKpVvaotOi4rodJu+L6x/JKn/Wi8yL1iv5imqJ8WzRBOnXKrah8M2wHOs0yPAti3C
         OJJ1A4RA9PxKWo7p2Be/BMKO98r8qx2U7O1aUJKc=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 33SIUci4107286
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 28 Apr 2023 13:30:38 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 28
 Apr 2023 13:30:37 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 28 Apr 2023 13:30:38 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 33SIUbqo027558;
        Fri, 28 Apr 2023 13:30:37 -0500
Date:   Fri, 28 Apr 2023 13:30:37 -0500
From:   Reid Tonking <reidt@ti.com>
To:     Tony Lindgren <tony@atomide.com>
CC:     "Raghavendra, Vignesh" <vigneshr@ti.com>, <aaro.koskinen@iki.fi>,
        <jmkrzyszt@gmail.com>, <linux-omap@vger.kernel.org>,
        <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: omap: Fix standard mode false ACK readings
Message-ID: <20230428183037.wbhds54dz5l4v5xa@reidt-t5600.dhcp.ti.com>
References: <20230426194956.689756-1-reidt@ti.com>
 <445b3cbf-ffbc-6f77-47db-c30fc599e88f@ti.com>
 <20230428074330.GJ14287@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230428074330.GJ14287@atomide.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10:43-20230428, Tony Lindgren wrote:
> * Raghavendra, Vignesh <vigneshr@ti.com> [230427 13:18]:
> > On 4/27/2023 1:19 AM, Reid Tonking wrote:
> > > Using standard mode, rare false ACK responses were appearing with
> > > i2cdetect tool. This was happening due to NACK interrupt triggering
> > > ISR thread before register access interrupt was ready. Removing the
> > > NACK interrupt's ability to trigger ISR thread lets register access
> > > ready interrupt do this instead.
> 
> So is it safe to leave NACK interrupt unhandled until we get the next
> interrupt, does the ARDY always trigger after hitting this?
> 
> Regards,
> 
> Tony

Yep, the ARDY always gets set after a new command when register access is ready so there's no need for NACK interrupt to control this. 

-Reid
