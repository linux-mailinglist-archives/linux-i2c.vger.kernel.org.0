Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D4EE243AA0
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Aug 2020 15:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726053AbgHMNNm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Aug 2020 09:13:42 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:54094 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726100AbgHMNNl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 13 Aug 2020 09:13:41 -0400
Received: from [37.161.87.136] (port=46789 helo=[192.168.42.162])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.93)
        (envelope-from <luca@lucaceresoli.net>)
        id 1k6D2s-0007Xk-BW; Thu, 13 Aug 2020 15:13:26 +0200
Subject: Re: [PATCH v2] ARM: s3c64xx: use simple i2c probe function
To:     Stephen Kitt <steve@sk2.org>, Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        patches@opensource.cirrus.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200809172243.15192-1-steve@sk2.org>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <8f0ef4d5-4a43-ee9b-816b-26dd347772b8@lucaceresoli.net>
Date:   Thu, 13 Aug 2020 15:13:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200809172243.15192-1-steve@sk2.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi,

On 09/08/20 19:22, Stephen Kitt wrote:
> The i2c probe functions here don't use the id information provided in
> their second argument, so the single-parameter i2c probe function
> ("probe_new") can be used instead.
> 
> This avoids scanning the identifier tables during probes.
> 
> Signed-off-by: Stephen Kitt <steve@sk2.org>

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>



-- 
Luca
