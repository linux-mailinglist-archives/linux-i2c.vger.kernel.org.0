Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B307E1DB574
	for <lists+linux-i2c@lfdr.de>; Wed, 20 May 2020 15:46:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbgETNqs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 20 May 2020 09:46:48 -0400
Received: from mga14.intel.com ([192.55.52.115]:20662 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726691AbgETNqr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 20 May 2020 09:46:47 -0400
IronPort-SDR: oLuX06C+679YCMq3dllWc+7lA79JtsVXD4WiXPriPZu76zRZ0aFGYgg+WJxdYNYWtJ1C6iHbJ5
 h813PQsjrweQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2020 06:46:46 -0700
IronPort-SDR: FiQ0YdxL6imuEgbL97dvKDaEj/o3fugYFFzntRzoroeXWhgN0pDKh43B+0nkp4oYwnDY0tAeSY
 ceaqgl4pLSwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,414,1583222400"; 
   d="scan'208";a="289355124"
Received: from mylly.fi.intel.com (HELO [10.237.72.161]) ([10.237.72.161])
  by fmsmga004.fm.intel.com with ESMTP; 20 May 2020 06:46:43 -0700
Subject: Re: [PATCH v3 3/3] mfd: ensure that AXP20X_I2C will have the right
 deps on X86
To:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>, Lee Jones <lee.jones@linaro.org>,
        Jean Delvare <jdelvare@suse.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Max Staudt <max@enpas.org>, Stefan Roese <sr@denx.de>,
        linux-acpi@vger.kernel.org, linux-i2c@vger.kernel.org
References: <cover.1589801950.git.mchehab+huawei@kernel.org>
 <cfbb80f220bba5051640d92fc00825bdaa2ec877.1589801950.git.mchehab+huawei@kernel.org>
 <aa23c170-f4e8-e1f0-5c7f-35e51ec84533@redhat.com>
 <20200518145302.56642b22@coco.lan> <20200520133429.GC5759@ninjato>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <ac3c9490-6f2b-e0a4-c817-39979a39afe0@linux.intel.com>
Date:   Wed, 20 May 2020 16:46:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200520133429.GC5759@ninjato>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 5/20/20 4:34 PM, Wolfram Sang wrote:
> 
>>> With that said I'm fine with giving this another try, maybe let
>>> the test builders / rand config builds play with it for a while
>>> and see what happens?
>>
>> Yeah, it makes sense to me.
> 
> I'd like to see an ACK from the designware maintainers before sending
> this upstream. Testing is all fine, of course.
> 
Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
