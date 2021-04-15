Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC49360616
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Apr 2021 11:45:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231309AbhDOJpy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Apr 2021 05:45:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:35246 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231614AbhDOJpx (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 15 Apr 2021 05:45:53 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5EB0D61166;
        Thu, 15 Apr 2021 09:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618479929;
        bh=mHUO7q4YvF+53ZYq0pQFLbZx8vFSz2zouLM+2LlidfU=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=YPEm9qCqJC4JDRH/aghhEkUciuEY6MwfRW9090WGKTseKblzftczluysGbJHsALvt
         44N/Am9hdQZrxt6Ulyb7av6c/XGbVEFgQGt4wlWiaqR3Y6NSNYt32p+eIg84SXt6uK
         f0wQVGC/ZtYPE7XuCo51SSIfUzttu4UnqZxqBktzBobKAt7PB2wpMDmcaQtg9vY+G5
         uvC1cexTsf5ffMhFf3XdVU0OKAlK16MlpD9zuVztOxTBkHz++J3cKxqWmQmJPzrhHu
         e/bJF3bHO05b9Pq0vP5M2c7EFnRUtSSZdR3leJlXmB11L7d4swfGraXMRXmu29QIEH
         tZnTGFCme3dlw==
Subject: Re: [PATCH 1/2] i2c: s3c2410: simplify getting of_device_id match
 data
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>
References: <20210415093803.162673-1-krzysztof.kozlowski@canonical.com>
From:   Sylwester Nawrocki <snawrocki@kernel.org>
Message-ID: <acb1c39f-8098-1457-c996-05f647bfa25f@kernel.org>
Date:   Thu, 15 Apr 2021 11:45:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210415093803.162673-1-krzysztof.kozlowski@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


On 15.04.2021 11:38, Krzysztof Kozlowski wrote:
> Use of_device_get_match_data() to make the code slightly smaller.
> 
> Signed-off-by: Krzysztof Kozlowski<krzysztof.kozlowski@canonical.com>

Reviewed-by: Sylwester Nawrocki <snawrocki@kernel.org>
