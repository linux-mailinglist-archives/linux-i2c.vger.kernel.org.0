Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1BF625C01C3
	for <lists+linux-i2c@lfdr.de>; Wed, 21 Sep 2022 17:39:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231370AbiIUPjN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 21 Sep 2022 11:39:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231378AbiIUPi6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 21 Sep 2022 11:38:58 -0400
Received: from mx.gpxsee.org (mx.gpxsee.org [37.205.14.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 84F8B99B42;
        Wed, 21 Sep 2022 08:35:17 -0700 (PDT)
Received: from [192.168.4.25] (unknown [62.77.71.229])
        by mx.gpxsee.org (Postfix) with ESMTPSA id 768F847A38;
        Wed, 21 Sep 2022 17:35:15 +0200 (CEST)
Message-ID: <7a5e5b07-2870-d47e-c364-b09d004cf873@gpxsee.org>
Date:   Wed, 21 Sep 2022 17:35:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH v2 2/3] Added Xilinx XDMA IP core driver
Content-Language: en-US
To:     Lizhi Hou <lizhi.hou@amd.com>
Cc:     dmaengine@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        martin.tuma@digiteqautomotive.com, mchehab@kernel.org,
        michal.simek@xilinx.com, vkoul@kernel.org
References: <19bd8ce4-2dde-e985-00f4-09b48decd3dc@amd.com>
 <e084352e-a784-accd-f267-9e0c30c7a92b@gpxsee.org>
 <921a1da6-e378-2632-7b68-ac59e3c24f68@amd.com>
From:   =?UTF-8?Q?Martin_T=c5=afma?= <tumic@gpxsee.org>
In-Reply-To: <921a1da6-e378-2632-7b68-ac59e3c24f68@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.6 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 21. 09. 22 17:15, Lizhi Hou wrote:
> 
> On 9/21/22 02:25, Martin Tůma wrote:
>> > Currently, the V3 patch series does not support register user logic
>> > interrupt yet.
>>
>> This is a showstopper for almost every XDMA based PCIe card. As the 
>> driver "consumes" the whole register space (including the user IRQs 
>> enable/disable registers), there is AFAIK no way how to enable the 
>> user IRQs when this driver is loaded.
>>
>> > Could you convert your driver to use this?
>>
>> Not without the user IRQs.
> 
> I provided the patch link for user logic IRQ support in previous reply. 
> You may pull it and patch it on top of the V3 patch series.
> 
> 
> Lizhi
> 
>>
>> M.

I'm sorry, I have missed that. With that modification it should be 
(theoretically - haven't tested it yet) possible to use our v4l2 driver 
with this XDMA driver instead of the one I have provided in my patches.

I will now try to rewrite our driver and test it with your XDMA driver 
to be sure it works. It will however definitely need a "V4" of your XDMA 
driver with that patch on github before it can be included into the 
kernel and be usable for all XDMA-based PCIe cards.

M.
