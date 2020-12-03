Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D28BA2CD59E
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Dec 2020 13:38:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388925AbgLCMh5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Dec 2020 07:37:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730341AbgLCMh4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Dec 2020 07:37:56 -0500
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10EF8C061A4E;
        Thu,  3 Dec 2020 04:37:16 -0800 (PST)
Received: by mail-wm1-x343.google.com with SMTP id f190so3793423wme.1;
        Thu, 03 Dec 2020 04:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uk5+3A50BKKrMe8dcsIhh3qZvhpNAaEd/JfhfBn8IXw=;
        b=q7y+Vd47osGtMcv46hfU0vM/RbDSaK5XG42iKSzCOiu9jTUvjtxLUDMwhZrLQ1na2e
         AzcBsrG6q3urJmJAldvuxEz26dhJ286yQhIr4YG0uQvh5gOBaQj/vmQ/FueJ3/x6EF0n
         6MbyMQhJcEthlr8Jpvxq2wK0ps9MOOKoCuyU8vvADN/K9BdLQU16Pp6XPwOSD8mDpmKj
         zumDDVtcLXw92FiCK9S4RbJ8wAxDxwTauSR+DTh5139KP0qwK8xcM4zDL/DeE+HUNLkD
         ZpKW7Wtwcl8qFWPzLqUiXsKrbpihp4V+Ruh/zEOU06uTp4KY8wXEWITz3BcMtaSvj30I
         FHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uk5+3A50BKKrMe8dcsIhh3qZvhpNAaEd/JfhfBn8IXw=;
        b=Qdk1F5SMz3AMEUOLenKrP/sILWHLoRpvcNCIvjc4nLOSL7Rgc1/ZnLohfW5aGSO53L
         jQ8OH8CnxtnXLCtjH+N3x8hw7vicvnOq8LxZammLswpbpAenl+YEnTVa5JUIszA7/PcQ
         Ef901mIO69ZeEBSkbkMhQy8CMUUL/JYd0Ss2YYDtT2JZPqQfurH/0ZJP160FfTiUYyfS
         Ddg1j0/tsjLlZlpS4aewQAyJ5BkJCm6TqyN3ZB6w1InHZhaItGhIoNolhXmZjlg2Zfgp
         Xigl5gs25degtqC/n/mGzrBnNBlLqNKCxLw9oEKXz6qinUjfJum5QcGs2G/SwYjvh/B7
         U1IA==
X-Gm-Message-State: AOAM531glSq/l1vqBTVTITsolx1Q1Tc0qtVq6UvjuP8I21CxorSAsDLJ
        GDjECh+z89kEn2wKCfuTS+Q=
X-Google-Smtp-Source: ABdhPJxy6ahurwH+Xr2faCWCbOWV6UkZC4ykHZnhCc3dzsg8ESd5WoP1EG/9zXKnXzI5Dh07hLMiaA==
X-Received: by 2002:a1c:2182:: with SMTP id h124mr3107484wmh.25.1606999034747;
        Thu, 03 Dec 2020 04:37:14 -0800 (PST)
Received: from [192.168.1.211] ([2.31.225.57])
        by smtp.gmail.com with ESMTPSA id b4sm1623772wrr.30.2020.12.03.04.37.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Dec 2020 04:37:14 -0800 (PST)
Subject: Re: [PATCH 18/18] ipu3: Add driver for dummy INT3472 ACPI device
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-media@vger.kernel.org, devel@acpica.org, rjw@rjwysocki.net,
        lenb@kernel.org, gregkh@linuxfoundation.org,
        mika.westerberg@linux.intel.com, linus.walleij@linaro.org,
        bgolaszewski@baylibre.com, wsa@kernel.org, yong.zhi@intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        robert.moore@intel.com, erik.kaneda@intel.com, pmladek@suse.com,
        rostedt@goodmis.org, sergey.senozhatsky@gmail.com,
        linux@rasmusvillemoes.dk, kieran.bingham+renesas@ideasonboard.com,
        jacopo+renesas@jmondi.org,
        laurent.pinchart+renesas@ideasonboard.com,
        jorhand@linux.microsoft.com, kitakar@gmail.com,
        heikki.krogerus@linux.intel.com
References: <20201130133129.1024662-1-djrscally@gmail.com>
 <20201130133129.1024662-19-djrscally@gmail.com>
 <20201130200719.GB4077@smile.fi.intel.com>
 <20201130233232.GD25713@pendragon.ideasonboard.com>
 <20201201155513.GB852@paasikivi.fi.intel.com>
 <20201201183758.GE3085@pendragon.ideasonboard.com>
 <20201202110956.GD852@paasikivi.fi.intel.com>
 <20201202124228.GF4486@pendragon.ideasonboard.com>
 <20201202150858.GF4077@smile.fi.intel.com>
From:   Dan Scally <djrscally@gmail.com>
Message-ID: <8c9e8818-6b5b-d5a5-b091-dab2d34ee0ee@gmail.com>
Date:   Thu, 3 Dec 2020 12:37:12 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201202150858.GF4077@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 02/12/2020 15:08, Andy Shevchenko wrote:
> On Wed, Dec 02, 2020 at 02:42:28PM +0200, Laurent Pinchart wrote:
>> On Wed, Dec 02, 2020 at 01:09:56PM +0200, Sakari Ailus wrote:
>>> On Tue, Dec 01, 2020 at 08:37:58PM +0200, Laurent Pinchart wrote:
> 
> ...
> 
>> I think we should consider ACPI to be a hack in the first place :-)
> 
> I feel that about DT (and all chaos around it) but it's not a topic here.
> 
>>> Could this be just one more platform device for each of the three cases (or
>>> one for the two latter; I'm not quite sure yet)?
>>
>> Using MFD for this seems a bit overkill to me. I won't care much as I
>> won't maintain those drivers, but the current situation is complex
>> enough, it was hard for me to understand how things worked. Adding yet
>> another layer with another platform device won't make it any simpler.
>>
>> If we want to split this in two, I'd rather have a tps68470 driver on
>> one side, without ACPI op region support, but registering regulators,
>> GPIOs and clocks (without using separate drivers and devices for these
>> three features), and an INT3472 driver on the other side, with all the
>> ACPI glue and hacks. The tps68470 code could possibly even be structured
>> in such a way that it would be used as a library by the INT3472 driver
>> instead of requiring a separate platform device.
> 
> I'm afraid TPS68470 is MFD in hardware and its representation in the MFD is
> fine. What we need is to move IN3472 pieces out from it.
> 
> And I agree with your proposal in general.

Way back when I first joined this project we thought we needed i2c
drivers for driving the tps68470's clks and regulators. Tsuchiya found
some in an old Intel tree; they needed some minor tweaks but nothing
drastic. And I think they're designed to work with the mfd driver that's
already in the kernel.

So, can we do this by just checking (in a new
platform/x86/intel_skl_int3472.c) for a CLDB buffer in the PMIC, and
calling devm_mfd_add_devices() with either the GPIO and OpRegion drivers
(if no CLDB buffer found) or with the GPIO, clk and regulator drivers
(If there's a CLDB and it's not a discrete PMIC). Or else, using the
code from this patch directly in the platform driver if the CLDB says
it's a discrete PMIC?

>>> The GPIO regulator case is relatively safe, but the real PMICs require
>>> regulator voltage control as well as enabling and disabling the regulators.
>>> That probably requires either schematics or checking the register values at
>>> runtime on Windows (i.e. finding out which system you're dealing with, at
>>> runtime).
> 

