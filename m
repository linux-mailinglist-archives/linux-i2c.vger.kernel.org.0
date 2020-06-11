Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 44B6D1F658B
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Jun 2020 12:23:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726973AbgFKKXj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 11 Jun 2020 06:23:39 -0400
Received: from mga04.intel.com ([192.55.52.120]:14519 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726693AbgFKKX1 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 11 Jun 2020 06:23:27 -0400
IronPort-SDR: zEBbqO0ZZi5Tr4kws+2lOvAvrRa7U4In6FB72giWAvvIvR6bxihPG+MUqz9c3ex1N1U6h29qVd
 w9xe+nThP1Uw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2020 03:23:26 -0700
IronPort-SDR: wURiVzZEZ0Dk8gYcylrzUFI7v+VW85UTla2irCv+bg/dA0kCavD/d5XwQx16Dg4D7S26sz/JxH
 LI1Km9PkaDwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,499,1583222400"; 
   d="scan'208";a="473655052"
Received: from mylly.fi.intel.com (HELO [10.237.72.69]) ([10.237.72.69])
  by fmsmga006.fm.intel.com with ESMTP; 11 Jun 2020 03:23:24 -0700
Subject: Re: [PATCH] i2c: Use separate MODULE_AUTHOR() statements for multiple
 authors
To:     Jean Delvare <jdelvare@suse.de>
Cc:     linux-i2c@vger.kernel.org, Wolfram Sang <wsa@kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>
References: <20200610141142.2598882-1-jarkko.nikula@linux.intel.com>
 <20200611120218.7324a7a7@endymion>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <1bea211b-6047-a8f1-08f1-3ef82fd04211@linux.intel.com>
Date:   Thu, 11 Jun 2020 13:23:24 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200611120218.7324a7a7@endymion>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On 6/11/20 1:02 PM, Jean Delvare wrote:
> Hi Jarrko,
> 
> On Wed, 10 Jun 2020 17:11:42 +0300, Jarkko Nikula wrote:
>> Modules with multiple authors should use multiple MODULE_AUTHOR()
>> statements. Split the i2c modules with multiple authors to use multiple
>> MODULE_AUTHOR() statements.
> 
> Out of curiosity, is this documented anywhere, and what is the
> rationale? FWIW, this change slightly increases the binary size of the
> modules.
> 
I randomly spotted it in i2c-i801.c and started wonder since typically 
I've seen multiple MODULE_AUTHOR() lines. Only mention about it I 
quickly found was in include/linux/module.h:

/*
  * Author(s), use "Name <email>" or just "Name", for multiple
  * authors use multiple MODULE_AUTHOR() statements/lines.
  */
#define MODULE_AUTHOR(_author) MODULE_INFO(author, _author)

> However I see multi-author MODULE_AUTHOR() statements left in
> i2c-nomadik.c, i2c-sirf.c and i2c-viapro.c, any reason why these are
> not included in your patch?
> 
My blind eye :-)

Will include these to 2nd version.

Jarkko
