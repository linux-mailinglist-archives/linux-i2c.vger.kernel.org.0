Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6B8D124D1C
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2019 17:23:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727277AbfLRQXv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Dec 2019 11:23:51 -0500
Received: from mga03.intel.com ([134.134.136.65]:15079 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726985AbfLRQXu (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 18 Dec 2019 11:23:50 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Dec 2019 08:23:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,330,1571727600"; 
   d="scan'208";a="415881663"
Received: from dshoemak-mobl.amr.corp.intel.com (HELO [10.251.3.243]) ([10.251.3.243])
  by fmsmga005.fm.intel.com with ESMTP; 18 Dec 2019 08:23:47 -0800
Subject: Re: [alsa-devel] [PATCH 10/10] ASoC: Add codec component for AD242x
 nodes
To:     Daniel Mack <daniel@zonque.org>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc:     lars@metafoo.de, sboyd@kernel.org, mturquette@baylibre.com,
        robh+dt@kernel.org, broonie@kernel.org, pascal.huerst@gmail.com,
        lee.jones@linaro.org
References: <20191209183511.3576038-1-daniel@zonque.org>
 <20191209183511.3576038-12-daniel@zonque.org>
 <0565e5cd-9a6e-db65-0632-0bc1aa1d79db@linux.intel.com>
 <35e7e6e7-7c70-785c-bdf3-79089134699e@zonque.org>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <ff0e2420-a2c6-17e7-2761-f6544e2c0cb7@linux.intel.com>
Date:   Wed, 18 Dec 2019 09:32:40 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <35e7e6e7-7c70-785c-bdf3-79089134699e@zonque.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 12/18/19 3:49 AM, Daniel Mack wrote:
> Hi,
> 
> On 12/17/19 8:28 PM, Pierre-Louis Bossart wrote:
>> On 12/9/19 12:35 PM, Daniel Mack wrote:
> 
>>> +    if (!ad242x_node_is_master(priv->node) &&
>>> +       ((format & SND_SOC_DAIFMT_MASTER_MASK) !=
>>> SND_SOC_DAIFMT_CBM_CFM)) {
>>> +        dev_err(component->dev, "slave node must be clock master\n");
>>> +        return -EINVAL;
>>> +    }
>>
>> It was my understanding that the master node provides the clock to the
>> bus, so not sure how it could be a clock slave, and conversely how a
>> slave node could provide a clock to the bus?
> 
> The slave nodes receive the A2B clock from the master node and then
> produce digital audio output that is sent to other components such as
> codecs. Hence, in ASoC terms, they are the clock master.
> 
> Likewise, as the master node is receiving its clock from other
> components, it has to be a clock slave in the audio network.
> 
> Does that make sense?

Your slave node acts as a bridge then, but it seems you don't model the 
bus-facing interface, which has to follow the master clock. Or do you?

Likewise the master has an 'SOC-facing' interface and a bus-facing 
interface. it *could* be master on both if ASRC was supported. The point 
is that the bus-facing interface is not clock slave.
