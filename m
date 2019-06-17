Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B48A547EF7
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Jun 2019 11:59:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727807AbfFQJ7K (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 17 Jun 2019 05:59:10 -0400
Received: from foss.arm.com ([217.140.110.172]:43798 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727693AbfFQJ7K (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 17 Jun 2019 05:59:10 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B6CDE344;
        Mon, 17 Jun 2019 02:59:09 -0700 (PDT)
Received: from [10.1.196.93] (en101.cambridge.arm.com [10.1.196.93])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 015A23F246;
        Mon, 17 Jun 2019 03:00:50 -0700 (PDT)
Subject: Re: [PATCH v2 06/28] drivers: Add generic helper to match by of_node
To:     wsa@the-dreams.de
Cc:     linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        rafael@kernel.org, atull@kernel.org, andrew@lunn.ch,
        daniel@ffwll.ch, airlied@linux.ie, davem@davemloft.net,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        f.fainelli@gmail.com, frowand.list@gmail.com, hkallweit1@gmail.com,
        jslaby@suse.com, jonathanh@nvidia.com, lee.jones@linaro.org,
        lgirdwood@gmail.com, linux-fpga@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
        maarten.lankhorst@linux.intel.com, broonie@kernel.org,
        mathieu.poirier@linaro.org, maxime.ripard@bootlin.com,
        mdf@kernel.org, peda@axentia.se, robh+dt@kernel.org,
        srinivas.kandagatla@linaro.org, thierry.reding@gmail.com,
        thor.thayer@linux.intel.com, ulf.hansson@linaro.org,
        joe@perches.com
References: <1560534863-15115-1-git-send-email-suzuki.poulose@arm.com>
 <1560534863-15115-7-git-send-email-suzuki.poulose@arm.com>
 <20190614203144.GB7991@kunai>
From:   Suzuki K Poulose <suzuki.poulose@arm.com>
Message-ID: <d050ae69-52ee-b32d-2bc0-708b408f3bd4@arm.com>
Date:   Mon, 17 Jun 2019 10:59:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190614203144.GB7991@kunai>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On 14/06/2019 21:31, Wolfram Sang wrote:
>> +
>> +int device_match_of_node(struct device *dev, const void *np)
>> +{
>> +	return dev->of_node == np;
>> +}
>> +EXPORT_SYMBOL_GPL(device_match_of_node);
> 
> Is it an option to 'static inline' this simple function in the header,
> saving the EXPORT?
> 

No. This is supposed to be passed on as a call back function pointer
for the APIs. Having it as a static inline, would simply replicate
the same function through the driver subsystems, which is one of the
issues that series is trying to solve. Also, by having them exported,
we can convert the new specialized device lookup functions,
*_find_device_by_<property> to be static inlines.

Suzuki
