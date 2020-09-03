Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFF2925BA34
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Sep 2020 07:40:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbgICFjT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 3 Sep 2020 01:39:19 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:48534 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725851AbgICFjT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 3 Sep 2020 01:39:19 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0835cxci027992;
        Thu, 3 Sep 2020 00:38:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1599111539;
        bh=F9qx02drHVcB8//fdoSXuY/MsTvAOdkkagWH+aAPtM4=;
        h=Subject:To:References:From:Date:In-Reply-To;
        b=KoZafF31vnIQDWV0+uLbXwLM4PqWr1uMwedrSsTrqSWyXNs5hoxrnXxDsvCU73HAj
         cdm5LAtcLoWBOIbipbltSRgoRaoT05JFCIIrj/v+wXDqTGBEZVwz0qtM1XOXAzNEmF
         ukzwWnqIdL1GZLesAIbxXBWOoua+RuZIqoMznDJ8=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0835cxFO101612;
        Thu, 3 Sep 2020 00:38:59 -0500
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Thu, 3 Sep
 2020 00:38:59 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Thu, 3 Sep 2020 00:38:58 -0500
Received: from [10.24.69.198] (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0835cugY086414;
        Thu, 3 Sep 2020 00:38:57 -0500
Subject: Re: [PATCH v2] ARM: davinci: use simple i2c probe function
To:     Wolfram Sang <wsa@kernel.org>, Stephen Kitt <steve@sk2.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-i2c@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20200809172444.16019-1-steve@sk2.org>
 <20200810093710.GD1290@kunai>
From:   Sekhar Nori <nsekhar@ti.com>
Message-ID: <72fa4547-355d-4c40-6857-4a957867b81c@ti.com>
Date:   Thu, 3 Sep 2020 11:08:55 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200810093710.GD1290@kunai>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 10/08/20 3:07 PM, Wolfram Sang wrote:
> On Sun, Aug 09, 2020 at 07:24:44PM +0200, Stephen Kitt wrote:
>> The i2c probe functions here don't use the id information provided in
>> their second argument, so the single-parameter i2c probe function
>> ("probe_new") can be used instead.
>>
>> This avoids scanning the identifier tables during probes.
>>
>> Signed-off-by: Stephen Kitt <steve@sk2.org>
> 
> This is useful, helps deprecating the old probe method:
> 
> Acked-by: Wolfram Sang <wsa@kernel.org>

Queued for v5.10.

Thanks,
Sekhar
