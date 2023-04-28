Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 453B66F12B2
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Apr 2023 09:46:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230049AbjD1HqF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Apr 2023 03:46:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345807AbjD1Hpf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 28 Apr 2023 03:45:35 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 689F84C03;
        Fri, 28 Apr 2023 00:44:24 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 3203980B5;
        Fri, 28 Apr 2023 07:43:32 +0000 (UTC)
Date:   Fri, 28 Apr 2023 10:43:30 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     "Raghavendra, Vignesh" <vigneshr@ti.com>
Cc:     Reid Tonking <reidt@ti.com>, aaro.koskinen@iki.fi,
        jmkrzyszt@gmail.com, linux-omap@vger.kernel.org,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] i2c: omap: Fix standard mode false ACK readings
Message-ID: <20230428074330.GJ14287@atomide.com>
References: <20230426194956.689756-1-reidt@ti.com>
 <445b3cbf-ffbc-6f77-47db-c30fc599e88f@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <445b3cbf-ffbc-6f77-47db-c30fc599e88f@ti.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

* Raghavendra, Vignesh <vigneshr@ti.com> [230427 13:18]:
> On 4/27/2023 1:19 AM, Reid Tonking wrote:
> > Using standard mode, rare false ACK responses were appearing with
> > i2cdetect tool. This was happening due to NACK interrupt triggering
> > ISR thread before register access interrupt was ready. Removing the
> > NACK interrupt's ability to trigger ISR thread lets register access
> > ready interrupt do this instead.

So is it safe to leave NACK interrupt unhandled until we get the next
interrupt, does the ARDY always trigger after hitting this?

Regards,

Tony
