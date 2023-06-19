Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 96654734EAB
	for <lists+linux-i2c@lfdr.de>; Mon, 19 Jun 2023 10:53:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230061AbjFSIxq (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 19 Jun 2023 04:53:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230392AbjFSIx1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 19 Jun 2023 04:53:27 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A35C72D5F;
        Mon, 19 Jun 2023 01:52:25 -0700 (PDT)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A4BA2547;
        Mon, 19 Jun 2023 10:51:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1687164710;
        bh=B00zRuFkwkcFL8RsmEawKa5iBKl4WJesv+28pc/wdYk=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=jaP57+xXVeWhodB/lrjQGKEzTI8MoWVBb9yCIpIMUnS2RqPs3OoJk5GHvK/JPAqc0
         UVA/arS/Lhdil2A59pODyshl6qRXo9zeWmrxAlMZPBOJFAuanISqbpLN06svvfMCqI
         KJZdN7BpVrYtqbjgn0IYUT5/XafDWr0QdHXv+nq4=
Message-ID: <78fdbb28-4133-0165-69ff-a0e568cd84fe@ideasonboard.com>
Date:   Mon, 19 Jun 2023 11:52:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v14 13/18] media: i2c: ds90ub953: Use
 v4l2_fwnode_endpoint_parse()
Content-Language: en-US
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Matti Vaittinen <Matti.Vaittinen@fi.rohmeurope.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Wolfram Sang <wsa@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Rosin <peda@axentia.se>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Tretter <m.tretter@pengutronix.de>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mike Pagano <mpagano@gentoo.org>,
        =?UTF-8?Q?Krzysztof_Ha=c5=82asa?= <khalasa@piap.pl>,
        Marek Vasut <marex@denx.de>,
        Satish Nagireddy <satish.nagireddy@getcruise.com>
References: <20230616135922.442979-1-tomi.valkeinen@ideasonboard.com>
 <20230616135922.442979-14-tomi.valkeinen@ideasonboard.com>
 <ZIxwjebnV/1JaoXt@smile.fi.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <ZIxwjebnV/1JaoXt@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 16/06/2023 17:24, Andy Shevchenko wrote:
> On Fri, Jun 16, 2023 at 04:59:17PM +0300, Tomi Valkeinen wrote:
>> Use v4l2_fwnode_endpoint_parse() to parse the sink endpoint parameters.
> 
>> +	nlanes = vep.bus.mipi_csi2.num_data_lanes;
>>   
> 
> I would also drop this blank line now.

Ok.

>> -	if (ret != 1 && ret != 2 && ret != 4)
>> +	if (nlanes != 1 && nlanes != 2 && nlanes != 4)
> 
> Isn't the following cleaner?
> 
> 	if (!is_power_of_2(nlanes) || nlanes > 4)

No, I don't think so... The current one is more human-readable.

>>   		return dev_err_probe(dev, -EINVAL,
>> -				     "bad number of data-lanes: %d\n", ret);
>> +				     "bad number of data-lanes: %d\n", nlanes);
> 

  Tomi

