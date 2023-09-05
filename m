Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 630CA792645
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Sep 2023 18:27:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241929AbjIEQUL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Sep 2023 12:20:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354008AbjIEJKl (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Sep 2023 05:10:41 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B7844DB
        for <linux-i2c@vger.kernel.org>; Tue,  5 Sep 2023 02:10:36 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2bcc187e0b5so34600741fa.1
        for <linux-i2c@vger.kernel.org>; Tue, 05 Sep 2023 02:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693905035; x=1694509835; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ezWE+bRS8Wk4jpjdVoE0OX6tkD+1ncG7U6Faqey9Iec=;
        b=o0n8z//ZmPqMBWjAzFPkfhGwOhtntpqbkhStLcf4MjohsALQEzFUfT29kcU5wMOq1m
         we/OK3ZKmI/9Dha6Ce32/aHGHsBH+gA/qlW2MQtdPrbALBqf0m2kAkCKk9+4+Itk4JEu
         iYmrFBEIjKRrE5wDGuA5Ig61NbaxtfNmCD9EGxuGcfui2V6VoidQ1TWVEVM9rbRk018B
         PVt9hEg6Inz+LMQJQB4O+mERwpPDYsWmWA01HVKsrNJj84mhHrZ2BRu71ADJhdrtvyY/
         8Y2Zkc76F3NqEQi72qYfp2LvbvJCcpy2uyetHLuG531zeGyfAqkEbGWfmEeSUMPJ/sUv
         VgAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693905035; x=1694509835;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ezWE+bRS8Wk4jpjdVoE0OX6tkD+1ncG7U6Faqey9Iec=;
        b=Kd5wdTbHtugRYHfseqmmXkr1UaDI6MjrQTnYV7HBQoTknjX6O39OeoXnSfm+iieWci
         yWk5lKEPk2MadbXJpPxUs4OjZt8olaH4u+HxWcDkjuSdt2RGpQjUb2epRKDTqt7NXitN
         e0Hz2XpblXk6mcm4GC1e9XVLG1WBJgUF2IXtg1ghJ9cut6cfzXjRvWYquvofzZoDrBFI
         N4X+/Py2ZjuE7EnUGCloV0jBrOpgdwht5V0hEyCvDLFpx+YWfgLZ9XtJvwPeUBCSqNfU
         hiLWGmdSzb8iLaMxMtTm90OaOSyD5VeLRDyNFrCAHcN7v5hSY3BpmAELmLUjFpWDe94j
         GN0g==
X-Gm-Message-State: AOJu0Yz0nkaMa50Az9kSX1S9SCF+VxcghfufjLLDfsjpDxF+coNKdKY3
        MlhvC6+lXNPEy5n8mS3bUB43sA==
X-Google-Smtp-Source: AGHT+IG/8Hg4BQMrH3+6aAoIu20KNzzz3XovcTafQIcQqq0cptHRxvTbfy4fQLNbmvLJnypcjovVXw==
X-Received: by 2002:a2e:8e8b:0:b0:2b6:e2e4:7d9a with SMTP id z11-20020a2e8e8b000000b002b6e2e47d9amr8925009ljk.38.1693905034899;
        Tue, 05 Sep 2023 02:10:34 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t25-20020a7bc3d9000000b003fed4fa0c19sm19551513wmj.5.2023.09.05.02.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 02:10:34 -0700 (PDT)
Date:   Tue, 5 Sep 2023 12:10:31 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc:     dmitry.baryshkov@linaro.org,
        Loic Poulain <loic.poulain@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Liao Chang <liaochang1@huawei.com>,
        Todor Tomov <todor.too@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Vinod Koul <vkoul@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
        error27@gmail.com, vegard.nossum@oracle.com
Subject: Re: [PATCH next] i2c: qcom-cci: Fix error checking in cci_probe()
Message-ID: <47e3acac-7d4f-43bd-bd55-5ae9ab993f2d@kadam.mountain>
References: <20230823194202.2280957-1-harshit.m.mogalapalli@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230823194202.2280957-1-harshit.m.mogalapalli@oracle.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Aug 23, 2023 at 12:42:02PM -0700, Harshit Mogalapalli wrote:
> devm_clk_bulk_get_all() can return zero when no clocks are obtained.
> Passing zero to dev_err_probe() is a success which is incorrect.
> 
> Fixes: 605efbf43813 ("i2c: qcom-cci: Use dev_err_probe in probe function")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---
> Only compile tested, found by static analysis with smatch.
> 
> https://lore.kernel.org/all/CAA8EJprTOjbOy7N5+8NiJaNNhK+_btdUUFcpHKPkMuCZj5umMA@mail.gmail.com/
> ^^ I reported initially here, Dmitry suggested we need to fix it in a
> different patch.
> 
> the Fixes commit used above pointed this bug, but the real fixes tag is this:
> Fixes: e517526195de ("i2c: Add Qualcomm CCI I2C driver")

This has already been applied but, for future reference, you should have
gone with the real fixes tag instead of where the static checker started
complaining.

regards,
dan carpenter

