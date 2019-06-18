Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8981049C66
	for <lists+linux-i2c@lfdr.de>; Tue, 18 Jun 2019 10:53:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729147AbfFRIx2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 18 Jun 2019 04:53:28 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:13022 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728991AbfFRIx2 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 18 Jun 2019 04:53:28 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d08a6870000>; Tue, 18 Jun 2019 01:53:27 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 18 Jun 2019 01:53:27 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 18 Jun 2019 01:53:27 -0700
Received: from [10.19.65.14] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 18 Jun
 2019 08:53:23 +0000
Subject: Re: [PATCH V1] i2c: tegra: disable irq in tegra_i2c_xfer_msg
To:     Jon Hunter <jonathanh@nvidia.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        <linux-i2c@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Peter Rosin <peda@axentia.se>,
        Wolfram Sang <wsa@the-dreams.de>,
        Dmitry Osipenko <digetx@gmail.com>
CC:     Shardar Mohammed <smohammed@nvidia.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mantravadi Karthik <mkarthik@nvidia.com>
References: <1560835386-2865-1-git-send-email-bbiswas@nvidia.com>
 <30d1d048-f474-f1fb-6415-ee6389900032@nvidia.com>
From:   Bitan Biswas <bbiswas@nvidia.com>
Message-ID: <93b72301-2132-f9da-b5b8-f2fb3c4163c4@nvidia.com>
Date:   Tue, 18 Jun 2019 01:53:21 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <30d1d048-f474-f1fb-6415-ee6389900032@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560848007; bh=jjS1JGwpvnUR+qVH5bcDlfnpRNxu98MHj8uxqf5sc4g=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=maxNwVfu+QLlK3N7Gb9XYDMz6xRGbcYNcjyRh2yil7sdTwbYA8lIFUHRHNrJxoT1s
         7WJtJUzc+7/sLxUzcWIDqxxNotlL3GyrjZV6QcZ2zj0Rn6h1VQVxt9pP5nuktYXsyg
         iJl1E3cUVDhMAt/POrFmWQflbIE6VzHOr4RRu8eiRKHWq6wFZM5UPpZURvOkK0Kt/M
         5/rW6cincGn8HqKy4IcA5PXcycPoset15rr38C+Uq4HtFTwD65Iw9WiThMuz4iC8tH
         a9KfJMYTHyiXrDVSah82AmJb2r+BytWA6pP7NamktnNm6zO0NXdbH2GGODOcMXx6VA
         w3nLmUJho/NHQ==
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org



On 6/17/19 11:32 PM, Jon Hunter wrote:
> 
> On 18/06/2019 06:23, Bitan Biswas wrote:
>> Synchronize ISR and tegra_i2c_xfer_msg execution
>> by disabling interrupt. This avoids spinlock usage
>> for same purpose.
> 
> I think that you need to explain the motivation/benefit of this. It is
> not immediately clear to me. Sorry if I have missed some previous
> discussion.
I updated the commit description with details and benefit. Please review 
Patch V2.

-regards,
  Bitan

