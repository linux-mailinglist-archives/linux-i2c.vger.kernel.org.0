Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 501FF1243B0
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2019 10:49:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726735AbfLRJtl (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Dec 2019 04:49:41 -0500
Received: from mail.bugwerft.de ([46.23.86.59]:46468 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726360AbfLRJtl (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 18 Dec 2019 04:49:41 -0500
Received: from [10.10.222.226] (unknown [194.162.236.226])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 056A6281DF4;
        Wed, 18 Dec 2019 09:43:13 +0000 (UTC)
Subject: Re: [alsa-devel] [PATCH 10/10] ASoC: Add codec component for AD242x
 nodes
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     lars@metafoo.de, sboyd@kernel.org, mturquette@baylibre.com,
        robh+dt@kernel.org, broonie@kernel.org, pascal.huerst@gmail.com,
        lee.jones@linaro.org
References: <20191209183511.3576038-1-daniel@zonque.org>
 <20191209183511.3576038-12-daniel@zonque.org>
 <0565e5cd-9a6e-db65-0632-0bc1aa1d79db@linux.intel.com>
From:   Daniel Mack <daniel@zonque.org>
Message-ID: <35e7e6e7-7c70-785c-bdf3-79089134699e@zonque.org>
Date:   Wed, 18 Dec 2019 10:49:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <0565e5cd-9a6e-db65-0632-0bc1aa1d79db@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 12/17/19 8:28 PM, Pierre-Louis Bossart wrote:
> On 12/9/19 12:35 PM, Daniel Mack wrote:

>> +    if (!ad242x_node_is_master(priv->node) &&
>> +       ((format & SND_SOC_DAIFMT_MASTER_MASK) !=
>> SND_SOC_DAIFMT_CBM_CFM)) {
>> +        dev_err(component->dev, "slave node must be clock master\n");
>> +        return -EINVAL;
>> +    }
> 
> It was my understanding that the master node provides the clock to the
> bus, so not sure how it could be a clock slave, and conversely how a
> slave node could provide a clock to the bus?

The slave nodes receive the A2B clock from the master node and then
produce digital audio output that is sent to other components such as
codecs. Hence, in ASoC terms, they are the clock master.

Likewise, as the master node is receiving its clock from other
components, it has to be a clock slave in the audio network.

Does that make sense?

>> +    switch (params_format(params)) {
>> +    case SNDRV_PCM_FORMAT_S16_LE:
>> +        if (priv->node->tdm_slot_size != 16)
>> +            return -EINVAL;
>> +        break;
>> +    case SNDRV_PCM_FORMAT_S32_LE:
>> +        if (priv->node->tdm_slot_size != 32)
>> +            return -EINVAL;
>> +        break;
>> +    default:
>> +        return -EINVAL;
>> +    }
> 
> how does this work for PDM data?
> 
> is the PDM data packed into a regular TDM slot?

Yes. But I admit this needs some more testing. We're still working on
the hardware that uses this. I'll revisit this.

And I'll also add a lot more comments all over the place, as also
requested by Lee.


Thanks,
Daniel
