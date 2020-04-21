Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F39011B2723
	for <lists+linux-i2c@lfdr.de>; Tue, 21 Apr 2020 15:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726780AbgDUNIS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 21 Apr 2020 09:08:18 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:11152 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726628AbgDUNIR (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 21 Apr 2020 09:08:17 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5e9eefce0000>; Tue, 21 Apr 2020 06:06:22 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 21 Apr 2020 06:08:17 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 21 Apr 2020 06:08:17 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 21 Apr
 2020 13:08:17 +0000
Received: from [10.26.73.24] (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 21 Apr
 2020 13:08:14 +0000
Subject: Re: [PATCH v2 1/2] i2c: tegra: Better handle case where CPU0 is busy
 for a long time
To:     Manikanta Maddireddy <mmaddireddy@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        "Laxman Dewangan" <ldewangan@nvidia.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        "Vidya Sagar" <vidyas@nvidia.com>
CC:     <linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20200324191217.1829-1-digetx@gmail.com>
 <20200324191217.1829-2-digetx@gmail.com>
 <1e259e22-c300-663a-e537-18d854e0f478@nvidia.com>
 <f59ba318-8e99-c486-fa4d-1ee28a7b203d@gmail.com>
 <b01cec76-bb39-9fb5-8f6e-4023c075e6b3@gmail.com>
 <8cd085e1-f9fd-6ec0-9f7a-d5463f176a63@nvidia.com>
 <2e99c2f0-4bba-2ea6-dada-3190c0303dcf@nvidia.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <1a5e5455-597f-7724-f992-32a2492c1e24@nvidia.com>
Date:   Tue, 21 Apr 2020 14:08:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <2e99c2f0-4bba-2ea6-dada-3190c0303dcf@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1587474382; bh=D09X4SPYe0zdr2xm0SGQdHD9ENL+ieH7CrlfNJV50pE=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=FG/VKS2gUyE9ggx8W/KlCgX7++6hiwZTb7M8JtJ9L7mNa60sGl/JjFNhsGi5fPbYS
         Z3JqK+0jmSYGX2x23lwm6SleC/53OyrLNcctWxXF2cRREMOawYPvar9IVGSIuktBpq
         wV4dS1xTUw+8cUcP+QRfHftomffoSHFsfPerfm+Zt00bogKk5J5uag6aYpzh4HcqOW
         rMcGMwj6LVURMpi9IqNkixSaQkrZeW1ChdIS5BNH/Jz9b6p+5zk1GNw5Pw1Y8FrTY1
         x0tRX184R1VyPmTWQt+ps+L2vmg5/97hJ06u0PuV6iyAfHyQa3c/2QI2zisv9wfyA8
         kNueyuTCcJVtw==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 21/04/2020 13:39, Manikanta Maddireddy wrote:

...

>> I am adding Manikanta to get some feedback on why we moved the PCI
>> suspend to the NOIRQ phase because it is not clear to me if we need to
>> do this here.
>>
>> Manikanta, can you comment on whether we really need to suspend Tegra
>> PCI during the noirq phase?
> 
> PCIe subsystem driver implemented noirq PM callbacks, it will save & restore
> endpoint config space in these PM callbacks. PCIe controller should be
> available during this time, so noirq PM callbacks are implemented in Tegra
> PCIe driver.
> 
> file: drivers/pci/pci-driver.c
> static const struct dev_pm_ops pci_dev_pm_ops = {
> 	...
>         .suspend_noirq = pci_pm_suspend_noirq,
>         .resume_noirq = pci_pm_resume_noirq,
>         ...
> };

Thanks, however, it is still not clear why this needs to be done during
this phase. When you say PCIe subsystem driver, specifically which
driver are you referring too? Are you referring to the
pci_pm_suspend_noirq() in the drivers/pci/pci-driver.c driver? If so,
just out of curiosity why does this need to be handled in the noirq phase?

Thanks
Jon

-- 
nvpublic
