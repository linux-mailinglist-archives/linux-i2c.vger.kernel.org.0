Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 215935988D0
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Aug 2022 18:29:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344462AbiHRQ0g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 18 Aug 2022 12:26:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345099AbiHRQ0K (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 18 Aug 2022 12:26:10 -0400
Received: from pokefinder.org (pokefinder.org [135.181.139.117])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 6E1B1325;
        Thu, 18 Aug 2022 09:25:55 -0700 (PDT)
Received: from localhost (p54b336f9.dip0.t-ipconnect.de [84.179.54.249])
        by pokefinder.org (Postfix) with ESMTPSA id AAD29A40FF1;
        Thu, 18 Aug 2022 18:25:54 +0200 (CEST)
Date:   Thu, 18 Aug 2022 18:25:54 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Asmaa Mnebhi <asmaa@nvidia.com>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Khalil Blaiech <kblaiech@nvidia.com>
Subject: Re: [PATCH v1 3/7] i2c-mlxbf: add multi slave functionality
Message-ID: <20220818162554.qfzt34v3hddy3htf@the-dreams.de>
References: <20220816225412.9095-1-asmaa@nvidia.com>
 <20220816225412.9095-4-asmaa@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220816225412.9095-4-asmaa@nvidia.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


> +// SPDX-License-Identifier: GPL-2.0 or BSD-3-Clause

This is a separate change, I'd say. Also...

>  MODULE_LICENSE("GPL v2");

... this has not been updated accordingly.

