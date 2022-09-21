Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B30EB5BFADE
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Sep 2022 11:26:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231622AbiIUJ0J (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Sep 2022 05:26:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231599AbiIUJ0D (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Sep 2022 05:26:03 -0400
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 940948F94C;
        Wed, 21 Sep 2022 02:25:53 -0700 (PDT)
Received: from [192.168.4.25] (unknown [62.77.71.229])
        by mx.gpxsee.org (Postfix) with ESMTPSA id 6BF41468C3;
        Wed, 21 Sep 2022 11:25:51 +0200 (CEST)
Message-ID: <e084352e-a784-accd-f267-9e0c30c7a92b@gpxsee.org>
Date:   Wed, 21 Sep 2022 11:25:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
To:     lizhi.hou@amd.com
Cc:     dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        martin.tuma@digiteqautomotive.com, mchehab@kernel.org,
        michal.simek@xilinx.com, tumic@gpxsee.org, vkoul@kernel.org
References: <19bd8ce4-2dde-e985-00f4-09b48decd3dc@amd.com>
Subject: Re: [PATCH v2 2/3] Added Xilinx XDMA IP core driver
Content-Language: en-US
From:   =?UTF-8?Q?Martin_T=c5=afma?= <tumic@gpxsee.org>
In-Reply-To: <19bd8ce4-2dde-e985-00f4-09b48decd3dc@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

 > Currently, the V3 patch series does not support register user logic
 > interrupt yet.

This is a showstopper for almost every XDMA based PCIe card. As the 
driver "consumes" the whole register space (including the user IRQs 
enable/disable registers), there is AFAIK no way how to enable the user 
IRQs when this driver is loaded.

 > Could you convert your driver to use this?

Not without the user IRQs.

M.
