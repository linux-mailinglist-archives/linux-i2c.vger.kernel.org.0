Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5F41B76D856
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Aug 2023 22:02:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232283AbjHBUCa (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Aug 2023 16:02:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231660AbjHBUCY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Aug 2023 16:02:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6780F26BC;
        Wed,  2 Aug 2023 13:02:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F0F4B61AAD;
        Wed,  2 Aug 2023 20:02:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFD67C433C7;
        Wed,  2 Aug 2023 20:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691006541;
        bh=KlYX+t57rsYgh1NP6IiBHAcbF9+7/lO+EJyXHCQqQQI=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=ErXtWBg0QLfz4lla1ShmwUisx5pmay6ZeaPra5WkNnaSlstpZ/sqFRfZ/bhyXLTBv
         rW8ZGqKqJcS4Fw5XSIr8+hs2Iui3JpspuNcf9zrd4xALoQ6DhZhi5DQhhyjcCRa2MI
         fODXL1mK6eK+0zaIFeOiZLTLzXtOQzcbH2wQKCOFkUpI/lwobZZO6nXXecsaMd9n1g
         reoEIh2IEN9NduvO8DZvcOYAgXPIBagi1EoaNudZ96yHjGdA3K8Lyyku760OQiKIxF
         AcDkyYqogBnV9ZQ5/Gz6XF7a+gzFTa5kA6outNKART7ks9RBCZJIh74DNg4U1mj0tQ
         cjErOBJ/BQ/9w==
From:   Andi Shyti <andi.shyti@kernel.org>
To:     linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Tam Nguyen <tamnguyenchi@os.amperecomputing.com>
Cc:     patches@amperecomputing.com, jarkko.nikula@linux.intel.com,
        andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com,
        jsd@semihalf.com, chuong@os.amperecomputing.com,
        darren@os.amperecomputing.com
In-Reply-To: <20230726080001.337353-1-tamnguyenchi@os.amperecomputing.com>
References: <20230726080001.337353-1-tamnguyenchi@os.amperecomputing.com>
Subject: Re: [PATCH v2 0/2] i2c: designware: Handle invalid SMBus block
 data response length value
Message-Id: <169100653810.1957828.14708654372750831092.b4-ty@kernel.org>
Date:   Wed, 02 Aug 2023 22:02:18 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On Wed, 26 Jul 2023 14:59:59 +0700, Tam Nguyen wrote:
> This v2 patch series updates the I2C DesignWare driver to handle invalid
> SMBus block data response length value that causes the bus is hang and
> can not be recovered.
> 
> v2:
>   + Create new commit to correct length byte validation logic    [Quan]
>   + Get right data length from IC_DATA_CMD register              [Jarkko]
> 
> [...]

Applied to i2c/andi-for-current on

https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git

Please note that this patch may still undergo further evaluation
and the final decision will be made in collaboration with
Wolfram.

Thank you,
Andi

Patches applied
===============
[1/2] i2c: designware: Correct length byte validation logic
      commit: 29a1ae0bd13f45da520a7106abfe347f9375f64e
[2/2] i2c: designware: Handle invalid SMBus block data response length value
      commit: dcd14feb235bed87a9cba63538bcf6a7a7e97b78

