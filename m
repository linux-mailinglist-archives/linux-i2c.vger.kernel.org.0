Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 660241235FF
	for <lists+linux-i2c@lfdr.de>; Tue, 17 Dec 2019 20:54:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728181AbfLQTyJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 17 Dec 2019 14:54:09 -0500
Received: from mga02.intel.com ([134.134.136.20]:22025 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727492AbfLQTyH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 17 Dec 2019 14:54:07 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Dec 2019 11:54:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,326,1571727600"; 
   d="scan'208";a="389942477"
Received: from vramados-mobl.amr.corp.intel.com (HELO [10.254.1.250]) ([10.254.1.250])
  by orsmga005.jf.intel.com with ESMTP; 17 Dec 2019 11:54:05 -0800
Subject: Re: [alsa-devel] [PATCH 00/10] mfd: Add support for Analog Devices
 A2B transceiver
To:     Daniel Mack <daniel@zonque.org>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
Cc:     lars@metafoo.de, sboyd@kernel.org, mturquette@baylibre.com,
        robh+dt@kernel.org, broonie@kernel.org, pascal.huerst@gmail.com,
        lee.jones@linaro.org
References: <20191209183511.3576038-1-daniel@zonque.org>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <cb86a793-014a-1acf-c144-f9014ac0a0ac@linux.intel.com>
Date:   Tue, 17 Dec 2019 13:29:20 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191209183511.3576038-1-daniel@zonque.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


> Transceivers can both receive and provide audio, and streams can be
> routed from one node to any other, including many others. The tricky
> bit is how to expose the audio routing in DT in a sane way.
> The way it is implemented here, the slave nodes specify the number of
> slots they each consume and generate, and which thereof they forward
> from one side to the other. This mimics the internal register
> structure and should allow for even exotic setups.

It was my understanding that the A2B bus is bidirectional but with 
separate time windows allocated for host->device and device->host 
transmission. The wording seems to hint at device-to-device 
communication but I wonder if this is really what you meant.
