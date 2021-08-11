Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CE083E9A30
	for <lists+linux-i2c@lfdr.de>; Wed, 11 Aug 2021 23:05:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229655AbhHKVFr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 11 Aug 2021 17:05:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbhHKVFr (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 11 Aug 2021 17:05:47 -0400
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C62A8C061765
        for <linux-i2c@vger.kernel.org>; Wed, 11 Aug 2021 14:05:22 -0700 (PDT)
Received: by mail-wr1-x430.google.com with SMTP id b11so4951223wrx.6
        for <linux-i2c@vger.kernel.org>; Wed, 11 Aug 2021 14:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:references:from:subject:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7qaap99tCitvNR1qjblnbzXJenXaRzQ6JAXjo2TMM98=;
        b=Eep7KB7ehlAc1hmCnH8lRvab35HTUKRRyW8hZajSi4/AU+CNIMQGzLotHp7AKmP45S
         NXrY3JvmicRbVLqjwExr85dJJgGrxswxdA7dj2yvFtkDDNFSmBNtklpoE+yoLlKyDU2P
         kUX2HgtJoLU13ktQA7F78OvECrd2b/jnZmJS6BuB4qDTyi48FfkIALPizeMSi1j+Ui0n
         fhzINQl/kRJ3Df2Lfwz7/EYwaGJLc7QPYXwNCfp3qOQwcTvXkSEpkS6rsi3C79lwHu8c
         AKf16vBxIbUv28+Z6zrKTD7PrLjDekHJHM3+F1rS0IWJtVs3l3axWBRI5kqmv5ReP9y+
         q5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7qaap99tCitvNR1qjblnbzXJenXaRzQ6JAXjo2TMM98=;
        b=D4r6WQEoPYtF+mTRPEeUM1oU2aZaSlbvmvxqPpJdnkr1MCAKMHtPwP/itSekvfTSiO
         FnFHXIcyGhdCaZbQ52UWCpURIS2JIRVi/paZsSZiFKH4DaCey+HDEdhdzr1nXzpECJk2
         vxjtAy9EnG4ESlsmt76HwUiLVJfGEkIcTEfxIAhzDXaBGCxVvH/vtYLEaraid3vHGGRG
         bWw+JxAH4rtis3uRZVJ4DDg+qQMg7Px4fpJEMF2/lJLxfC7TJ7SdWr/dcJGb0pY6W8l2
         +2OieWi2QjcP1HNB8vvfiquaPHTi1ra3UUFKZVYBWGcA56uvFHAOOlboqKTPBhqKoe+1
         2Q1g==
X-Gm-Message-State: AOAM530kEL2+W10m7r8i0WT+7bE8Kh5dE7x8IquTPp/xzc+b4/+SK84Q
        LOpnfNrHC4KUd8wCJFaZba4eY0hjEmWwHA==
X-Google-Smtp-Source: ABdhPJz/MI7+EiuDsd6hXQIAaamn3mN0sHrZzCkZDBdwbAhAJ/0zaFUDBGcK777c9zIk4T+w4YvgSA==
X-Received: by 2002:adf:e58a:: with SMTP id l10mr387665wrm.234.1628715921150;
        Wed, 11 Aug 2021 14:05:21 -0700 (PDT)
Received: from ?IPv6:2003:ea:8f10:c200:988:dfda:c500:b22? (p200300ea8f10c2000988dfdac5000b22.dip0.t-ipconnect.de. [2003:ea:8f10:c200:988:dfda:c500:b22])
        by smtp.googlemail.com with ESMTPSA id i3sm6855580wmb.17.2021.08.11.14.05.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Aug 2021 14:05:20 -0700 (PDT)
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Jean Delvare <jdelvare@suse.com>,
        "linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <e46ac7c1-1bb0-2caf-58e6-2fcaa89d30ae@gmail.com>
 <3ce2ea87-809e-5999-e920-07ddd5fcc035@gmail.com>
 <YRPyUM/nGD3dQv9C@smile.fi.intel.com>
From:   Heiner Kallweit <hkallweit1@gmail.com>
Subject: Re: [PATCH v2 8/9] i2c: i801: Improve
 register_dell_lis3lv02d_i2c_device
Message-ID: <8ba091fd-b6ff-e800-1c46-aaf9992f1e03@gmail.com>
Date:   Wed, 11 Aug 2021 23:05:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YRPyUM/nGD3dQv9C@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 11.08.2021 17:52, Andy Shevchenko wrote:
> On Fri, Aug 06, 2021 at 11:18:05PM +0200, Heiner Kallweit wrote:
>> - Use an initializer for struct i2c_board_info info
>> - Use dmi_match()
>> - Simplify loop logic
> 
> I'm wondering if changing this to a DMI match table will give better result.
> 
> Something like
> (Sorry I forgot APIs, but plenty of examples are under PDx86: drivers/platform/x86):
> 
> struct dmi_..._id *id;
> 
> id = dmi_..._match();
> if (!id) {
> 	pci_warn();
> 	return;
> }
> 
> i2c_new_client_device(...);
> 
> 

We could do something like the following. Whether it's better may be a
question of personal taste. I have no strong opinion here and would leave
it to Jean.

const struct dmi_system_id lis3_id_table[] = {
        {
                .driver_data = (void *)0x29,
                .matches = {
                        DMI_MATCH(DMI_PRODUCT_NAME, "Latitude E5550"),
                },
        },
	...

dmi_system_id *id = dmi_first_match(lis3_id_table);
if (id)
	i2c_new_client_device(..., (unsigned int)id->driver_data;
else
	lament()

