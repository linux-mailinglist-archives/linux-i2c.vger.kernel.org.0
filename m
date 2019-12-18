Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D68491243C0
	for <lists+linux-i2c@lfdr.de>; Wed, 18 Dec 2019 10:53:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726360AbfLRJxF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 18 Dec 2019 04:53:05 -0500
Received: from mail.bugwerft.de ([46.23.86.59]:46500 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725799AbfLRJxF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 18 Dec 2019 04:53:05 -0500
Received: from [10.10.222.226] (unknown [194.162.236.226])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 3A811281DF4;
        Wed, 18 Dec 2019 09:46:38 +0000 (UTC)
Subject: Re: [alsa-devel] [PATCH 00/10] mfd: Add support for Analog Devices
 A2B transceiver
To:     Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-i2c@vger.kernel.org, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     lars@metafoo.de, sboyd@kernel.org, mturquette@baylibre.com,
        robh+dt@kernel.org, broonie@kernel.org, pascal.huerst@gmail.com,
        lee.jones@linaro.org
References: <20191209183511.3576038-1-daniel@zonque.org>
 <cb86a793-014a-1acf-c144-f9014ac0a0ac@linux.intel.com>
From:   Daniel Mack <daniel@zonque.org>
Message-ID: <22803ea0-0c4a-b096-ec11-5e8f5c27d8d3@zonque.org>
Date:   Wed, 18 Dec 2019 10:53:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <cb86a793-014a-1acf-c144-f9014ac0a0ac@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 12/17/19 8:29 PM, Pierre-Louis Bossart wrote:
>> Transceivers can both receive and provide audio, and streams can be
>> routed from one node to any other, including many others. The tricky
>> bit is how to expose the audio routing in DT in a sane way.
>> The way it is implemented here, the slave nodes specify the number of
>> slots they each consume and generate, and which thereof they forward
>> from one side to the other. This mimics the internal register
>> structure and should allow for even exotic setups.
> 
> It was my understanding that the A2B bus is bidirectional but with
> separate time windows allocated for host->device and device->host
> transmission. The wording seems to hint at device-to-device
> communication but I wonder if this is really what you meant.

Yes, audio frames can be exchanged between two slave nodes without
interaction by the master node. I'm not sure what the best way is to
describe that in DT really, but as the hardware is capable of doing it,
there must be a way to enable such setups.


Thanks,
Daniel

