Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB74E14966
	for <lists+linux-i2c@lfdr.de>; Mon,  6 May 2019 14:16:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbfEFMQD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 6 May 2019 08:16:03 -0400
Received: from mga09.intel.com ([134.134.136.24]:36033 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725856AbfEFMQD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 6 May 2019 08:16:03 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 May 2019 05:16:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,437,1549958400"; 
   d="scan'208";a="321937001"
Received: from mylly.fi.intel.com (HELO [10.237.72.57]) ([10.237.72.57])
  by orsmga005.jf.intel.com with ESMTP; 06 May 2019 05:16:00 -0700
Subject: Re: [decode-dimms] Crucial Ballistix BLS2K16G4D30AESB, cannot decode
 / understand timings
To:     Dreamcat4 <dreamcat4@gmail.com>, Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org
References: <CAN39uTqhOxGSFvPsvZawBD-7kPLo9j0ONNYNyADXP9yqqwHEfA@mail.gmail.com>
 <20190411211239.440d71f1@endymion>
 <CAN39uTrd4zw+mWa=zSjZF+zNH-B1B2+YwO_4913FDP56iQNb9w@mail.gmail.com>
 <20190412164325.0b410662@endymion>
 <CAN39uTpx+daGd1w6k=sKQMQzUSJqvQxYLaD96fszap2=w63qVg@mail.gmail.com>
 <20190412204203.69f4a4be@endymion>
 <f1e9c190-7956-25c3-8e99-3a2ec100fd1a@linux.intel.com>
 <20190415152441.451c0e66@endymion>
 <CAN39uTqWDpRYOyHWfcEMoamPPuFJXFZwgYpMVDM4-aTz5yicOw@mail.gmail.com>
 <20190416165946.48059d1c@endymion>
 <8052f568-32ab-7104-b9bb-7bcb07179a6c@linux.intel.com>
 <20190417174002.651974bd@endymion>
 <06a90410-851f-618c-c203-ed3fc414ea18@linux.intel.com>
 <20190419203909.2b8991a1@endymion>
 <CAN39uTp_NTiUB_ZbhZkYQia3-YC0on_A5g87mt8T4uBYsKkb9Q@mail.gmail.com>
 <20190419223118.28b70421@endymion>
 <bf2a2dce-694c-db9b-e91e-deae4051d44b@linux.intel.com>
 <20190506110646.55cfc6ca@endymion>
 <CAN39uTojOZg-LYs9JOxAart2gPU37VQpvfB6PDoVvypPfcSWLg@mail.gmail.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <dfa9a609-002b-2853-53c1-616d3e248c08@linux.intel.com>
Date:   Mon, 6 May 2019 15:16:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAN39uTojOZg-LYs9JOxAart2gPU37VQpvfB6PDoVvypPfcSWLg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 5/6/19 12:15 PM, Dreamcat4 wrote:
> Hi Jean,
> Here is the output you requested
> 
> [root:~] # sudo modprobe i2c-i801
> [root:~] # sudo i2cdetect -l
> i2c-1    i2c           NVIDIA i2c adapter 5 at 1:00.0      I2C adapter
> i2c-2    smbus         SMBus I801 adapter at f000          SMBus adapter
> i2c-0    i2c           NVIDIA i2c adapter 4 at 1:00.0      I2C adapter
> [root:~] # i2cset 2 0x36 0x00 0x00
> WARNING! This program can confuse your I2C bus, cause data loss and worse!
> I will write to device file /dev/i2c-2, chip address 0x36, data address
> 0x00, data 0x00, mode byte.
> Continue? [Y/n] y
> Error: Write failed
> [root:~] 1 #
> 
Same error here.

-- 
Jarkko
