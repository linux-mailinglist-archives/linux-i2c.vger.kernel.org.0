Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54EEB5BFB97
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Sep 2022 11:47:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231791AbiIUJrw (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Sep 2022 05:47:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231793AbiIUJrg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Sep 2022 05:47:36 -0400
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 023FF81686;
        Wed, 21 Sep 2022 02:44:51 -0700 (PDT)
Received: from [192.168.4.25] (unknown [62.77.71.229])
        by mx.gpxsee.org (Postfix) with ESMTPSA id 0CDF5488AC;
        Wed, 21 Sep 2022 11:44:50 +0200 (CEST)
Message-ID: <285cddef-bc3e-dd86-46e0-5f4de6ebcd32@gpxsee.org>
Date:   Wed, 21 Sep 2022 11:44:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
To:     sonal.santan@amd.com
Cc:     dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        martin.tuma@digiteqautomotive.com, mchehab@kernel.org,
        michal.simek@xilinx.com, tumic@gpxsee.org, vkoul@kernel.org
References: <40c6af79-9288-7a67-e41b-30c288dbe1ff@amd.com>
Subject: Re: [PATCH v2 0/3] Digiteq Automotive MGB4 driver
Content-Language: en-US
From:   =?UTF-8?Q?Martin_T=c5=afma?= <tumic@gpxsee.org>
In-Reply-To: <40c6af79-9288-7a67-e41b-30c288dbe1ff@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

 > Xilinx/AMD is working on upstreaming the XDMA driver into Linux
 > dmaengine subsystem for use by all users of XDMA IP. You can find the 
 > V3
 > patch set here:
 >
 > 
https://lore.kernel.org/dmaengine/1663631039-49732-1-git-send-email-lizhi.hou@amd.com/T/#t

That's good news. If this would happen before I have spend two weeks 
converting the original Xilinx "driver" to something with at least a 
theoretical chance to be included into the kernel, it would be even 
better... ;-)

 > Will appreciate your review of that patch set and hopefully MGB4 driver
 > can be rebased on top it?

As I already replied to Lizhi Hou, this new XDMA driver is at the moment 
unusable for most XDMA-based HW as it does not handle the user IRQs 
logic and as it also takes up the user IRQs register memory space, it 
even actively hinders other drivers to at least handle the IRQs themselves.

M.
