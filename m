Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 700BA61F2AA
	for <lists+linux-i2c@lfdr.de>; Mon,  7 Nov 2022 13:13:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232022AbiKGMNL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 7 Nov 2022 07:13:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232021AbiKGMNJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 7 Nov 2022 07:13:09 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D3132BE9;
        Mon,  7 Nov 2022 04:13:03 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 352D1E7B;
        Mon,  7 Nov 2022 13:13:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1667823181;
        bh=RK4hAicLNHkx5IRKVwokvjvKjeVGgLibPk6NdO5V030=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=SbSMWifdKrmJfhUvnzIGXFDIT3dnQdshiZ84nmQh0Q7F2LRaWRx0sWMUq8ldPT8Tu
         Heo2CLiu9ESPuSmvJHvATQsvDSHuKOyTZalpz9EJhQ4QPQXP8O/oaW9ip6UnChbBUA
         MiWNPwT4FFHHXUaoR7FlB4F18h9jSxBTCykdTL+U=
Message-ID: <228da3c5-44b1-153c-c6e6-3bc221209bec@ideasonboard.com>
Date:   Mon, 7 Nov 2022 14:12:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4 0/8] i2c-atr and FPDLink
Content-Language: en-US
To:     Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc:     devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Rob Herring <robh+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        satish.nagireddy@getcruise.com
References: <20221101132032.1542416-1-tomi.valkeinen@ideasonboard.com>
 <20221107124814.19b12473@booty>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20221107124814.19b12473@booty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 07/11/2022 13:48, Luca Ceresoli wrote:

>> In fact, I'm thinking that it might be better to just drop the i2c-atr
>> driver, and add the support directly to the FPDlink drivers. But that
>> could mean possibly duplicating the same code for other deser/ser
>> architectures, so I have kept the i2c-atr driver for now.
> 
> Indeed I think the ROHM serdes chips do have an address translation
> feature that works pretty much like the TI ones, and the ATR should be
> cleanly reusable across the two brands. The ATR code might be
> simplified to just provide helpers for common code maybe, but I'd
> rather avoid code duplication.

I agree. The reason I'm wondering about this is the fact that the i2c 
slave side (deser) is in a different IC and driver than the i2c master 
side and driver (ser). That makes it quite different from the i2c-mux 
(at least how the i2c-mux exists now).

  Tomi

