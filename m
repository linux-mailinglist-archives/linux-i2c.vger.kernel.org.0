Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C856D2348AD
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Jul 2020 17:49:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387575AbgGaPtU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 Jul 2020 11:49:20 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:1219 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387555AbgGaPtU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 31 Jul 2020 11:49:20 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f243d510000>; Fri, 31 Jul 2020 08:48:33 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 31 Jul 2020 08:49:19 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 31 Jul 2020 08:49:19 -0700
Received: from [10.2.167.221] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 Jul
 2020 15:49:18 +0000
Subject: Re: [RFC PATCH v6 00/10] Support for Tegra video capture from
 external sensor
To:     Wolfram Sang <wsa@kernel.org>
CC:     <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <frankc@nvidia.com>, <hverkuil@xs4all.nl>, <sakari.ailus@iki.fi>,
        <robh+dt@kernel.org>, <helen.koike@collabora.com>,
        <digetx@gmail.com>, <sboyd@kernel.org>,
        <gregkh@linuxfoundation.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>
References: <1596186169-18729-1-git-send-email-skomatineni@nvidia.com>
 <20200731134045.GA1679@kunai>
From:   Sowjanya Komatineni <skomatineni@nvidia.com>
Message-ID: <0ed73611-563c-b2b9-5437-2a848a47a1e2@nvidia.com>
Date:   Fri, 31 Jul 2020 08:49:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200731134045.GA1679@kunai>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596210513; bh=c1gKy5mGElfQPb+jLgjvLHeQ+t/NpZKMy7vihPsApnU=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=aPSWauCy3NyVAFBHgaeq57/D7EBQJCVbCDriTOM9PQTZ3UBeU6nbP/M7g8x9nIfhs
         73AvEK77OW9LMlfjNvvUgkDR3DrZW/a/GrDWEZBZZrE/Zi9b60YkKo/nRGe1kUOr5y
         FI7O705yLijMsMtZ4K6biiH1V8MnEJxdWhzgx1ruS2aihEEmpurXsS3HoeNbSJ7YyL
         wJnT9O7QKVXqgX4SMjBzBlvxi7TgvmNmIf/MhiT4hERwGFC/xTEw6KvPZ0eAkw/TJ/
         BAMd+R5TaKCJS62J0cElOKJFK9sz+YKOFO6wQw5ca3iyjSEjhXdx4kYFWFstWxCYLM
         wIzCQlWPfW7PA==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Sorry Wolfram.

Will remove from CC list on my next replies..

On 7/31/20 6:40 AM, Wolfram Sang wrote:
> On Fri, Jul 31, 2020 at 02:02:39AM -0700, Sowjanya Komatineni wrote:
>> This series adds support for video capture from external camera sensor to
>> Tegra video driver.
> No need anymore to CC me or the i2c-list, I think? Also, is this series
> really still RFC?
