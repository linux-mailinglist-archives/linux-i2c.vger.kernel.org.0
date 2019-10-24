Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7139E3A8F
	for <lists+linux-i2c@lfdr.de>; Thu, 24 Oct 2019 20:03:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406407AbfJXSDN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 24 Oct 2019 14:03:13 -0400
Received: from mga18.intel.com ([134.134.136.126]:2753 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2406106AbfJXSDN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 24 Oct 2019 14:03:13 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 24 Oct 2019 11:03:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,225,1569308400"; 
   d="scan'208";a="349783476"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.148]) ([10.7.153.148])
  by orsmga004.jf.intel.com with ESMTP; 24 Oct 2019 11:03:13 -0700
Subject: Re: AST2600 i2c irq issue
To:     Eddie James <eajames@linux.vnet.ibm.com>,
        Ryan Chen <ryan_chen@aspeedtech.com>,
        Joel Stanley <joel@jms.id.au>,
        Brendan Higgins <brendanhiggins@google.com>
Cc:     linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Eddie James <eajames@linux.ibm.com>
References: <CACPK8XdqFkPgCQcgpM5C_YwfJ86Lmk=hG5zTcfbCDCMncXCJMg@mail.gmail.com>
 <f9fecc04-2a9a-4cbd-a1ff-ffb680b0fec2@linux.vnet.ibm.com>
 <dbb8635e-a95a-3951-cd65-3428adc461ec@linux.intel.com>
 <8c62b118777c44d1bf8e1a3c32175644@TWMBX02.aspeed.com>
 <333e959f-9296-b6d5-9442-b979a8abd50d@linux.vnet.ibm.com>
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <5508f358-77b8-f5f7-2577-79da25e4e5ea@linux.intel.com>
Date:   Thu, 24 Oct 2019 11:03:13 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <333e959f-9296-b6d5-9442-b979a8abd50d@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Eddie,

On 10/22/2019 1:24 PM, Eddie James wrote:

[...]

> 7: irq[00000000] before[rx] after[stop]

'irq[]' here and '10[]' below are the same register. This log means an
interrupt came with empty status.

>      00[00008001]
>      04[007ee005]
>      08[00000000]
>      0c[0000607f]
>      10[00000004]    <<< this is interesting. this has changed since the 
> start of the interrupt handler.

The interrupt status was updated lately at here. Looks like there is a
timing gap in H/W between interrupt triggering and status updating. I
haven't seen this issue in previous H/W versions.

This issue can be resolved by your patch but ultimately this issue
should be fixed in AST2600 A1 revision H/W if possible so that we can
remove the unnecessary interrupt handling.

Thanks,

Jae
