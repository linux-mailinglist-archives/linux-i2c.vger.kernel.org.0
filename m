Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 076286ECB74
	for <lists+linux-i2c@lfdr.de>; Mon, 24 Apr 2023 13:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230455AbjDXLjt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 24 Apr 2023 07:39:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbjDXLjs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 24 Apr 2023 07:39:48 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 152FD3A8C;
        Mon, 24 Apr 2023 04:39:47 -0700 (PDT)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 528919DE;
        Mon, 24 Apr 2023 13:39:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1682336375;
        bh=EUbi7UFRE4+2j80EmuVSCzh3PaCZh3bXKvkO45pL+aY=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=QQLyWApf0YH0bHN74OYq66Fxp+BFcxWhz/3BU9tVTWJ2o1v+FvZ2xne+PqgEJFpaT
         5OliG80OS1nnFhMrdCAl+S1xDkwuGo1X78z1SrYye1RpNqGOxsJdXViVpTNhyOPT/l
         JuxrmAgH3plrn8ZPdfsAfA+QFhrS86dodc4TGzxw=
Message-ID: <56d49d1d-c85e-4db8-7fb3-a43551dfe213@ideasonboard.com>
Date:   Mon, 24 Apr 2023 14:39:40 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v11 1/7] i2c: add I2C Address Translator (ATR) support
Content-Language: en-US
To:     Wolfram Sang <wsa@kernel.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20230421101833.345984-1-tomi.valkeinen@ideasonboard.com>
 <20230421101833.345984-2-tomi.valkeinen@ideasonboard.com>
 <ZEZafj6j+EurGWJ7@sai>
 <f9be2c5d-1303-1b91-c672-7e5a476277e7@ideasonboard.com>
 <30e4656f-63d9-a79c-c1d9-23d0a16cf184@ideasonboard.com>
 <ZEZo1WxjkcMiWKPg@sai>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <ZEZo1WxjkcMiWKPg@sai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 24/04/2023 14:32, Wolfram Sang wrote:
> 
>>> Ah, right. I'll resend with the DT bindings separate.
>>
>> Also, looks like I forgot to remove the namespaces for export symbols.
> 
> And why not keeping them? I understand ATR would be the first user in
> the Linux I2C world, but someone has to start it...

Well, you requested to remove them =). I originally didn't have them, 
but added them on Andy's request. I personally don't mind either way.

  Tomi

