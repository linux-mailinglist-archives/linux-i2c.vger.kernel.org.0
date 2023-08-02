Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 399F876D664
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Aug 2023 20:03:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232745AbjHBSDd (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 2 Aug 2023 14:03:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232775AbjHBSDV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 2 Aug 2023 14:03:21 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5130B2D71;
        Wed,  2 Aug 2023 11:01:54 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-686f38692b3so42645b3a.2;
        Wed, 02 Aug 2023 11:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690999257; x=1691604057;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=k2XMrOToRoh8aCARoCJWFLIEbmlNoQGNnHEjKDSNOwA=;
        b=ZLN0v1xJAvdW7sKoHDTD+cRpAruHBecDX5TUsQADCn0VaMN9V2+qrGXCCloFIEAuEu
         cVt3SqqaIT8wn0sQpeck/HtkkoOAOcfRTyj4IslV0cPhc+cDPI/CwckprQGq6ue4Naek
         9nJ6cHB2SGUZzlF2ficoy1ie8YQx340OJgJKCofHzct27SnXALMhj3k4Ztxy8DtJdrU8
         301kbt8MQtibbU9kpmIW+Y2AyIvd1YDKOje/DFjX/iawfqL2YkbXS1pY2z5NG6+NtgQC
         xLI62knS0+m7JMCGA56INVxlyz8ZgtvVAfYBlns8CMhuOd9FRUreIH2zENgqHs9E6koM
         vCeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690999257; x=1691604057;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k2XMrOToRoh8aCARoCJWFLIEbmlNoQGNnHEjKDSNOwA=;
        b=K90Eb+F3M8yJRBqdfwT9SYQtNGJj2rE7Ii0nXCzSd561zFhWUyjG88Ffw3GCa+v0z9
         B2qQLbVccZKu4xVJ6JOlrRONjdFeykhSN05rRnhuOKtslau1d9GSRWEQ8GODW9wehYF7
         FELLFqhFb1n9r8ik/Pcp0BCk+0LHayE8QGQhrSBsuIsSZBv9w+s5yQRHMW3ywIQ2xMVi
         br2bAjAY226vUyJQO72qOGY+AC/bDuIAWjvgIpPkjmNS6ro6hvbPGVImRxsTbUAxfNwj
         pedjLg1vL7TaBElYVhEAeWGqnigopXXVZCeFHTfd+yQaDeMgCQUGQinaqwqBUbKOMktV
         RRiQ==
X-Gm-Message-State: ABy/qLbXO5aD1ItkpEhIjwAHuOKG+YOy1THxt20XLSH1jXmDihIzG0lR
        NsLL/+Q8vS1eBHgGnUpL+iw=
X-Google-Smtp-Source: APBJJlE92FIcLg6ymflllmcfpd9wb2DqemWddFvd7ALXv6AKxrDiMzdqHzmIUkqKNQ5CftjUTlNqNQ==
X-Received: by 2002:a05:6a20:9719:b0:11c:fc27:cda4 with SMTP id hr25-20020a056a20971900b0011cfc27cda4mr16848901pzc.11.1690999257280;
        Wed, 02 Aug 2023 11:00:57 -0700 (PDT)
Received: from google.com ([2620:15c:9d:2:877e:78a5:c7ac:e1d4])
        by smtp.gmail.com with ESMTPSA id w9-20020aa78589000000b0065438394fa4sm11685530pfn.90.2023.08.02.11.00.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 11:00:56 -0700 (PDT)
Date:   Wed, 2 Aug 2023 11:00:54 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 3/3] i2c: Extend i2c_device_get_match_data() to
 support i2c sysfs
Message-ID: <ZMqZ1oT8SZiEX4dG@google.com>
References: <20230802112317.252745-1-biju.das.jz@bp.renesas.com>
 <20230802112317.252745-4-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802112317.252745-4-biju.das.jz@bp.renesas.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FSL_HELO_FAKE,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Niju,

On Wed, Aug 02, 2023 at 12:23:17PM +0100, Biju Das wrote:
> @@ -141,6 +141,7 @@ i2c_of_match_device_sysfs(const struct of_device_id *matches,
>  
>  	return NULL;
>  }
> +EXPORT_SYMBOL_GPL(i2c_of_match_device_sysfs);

This is private to i2c core, you do not need to export it to modules.

Thanks.

-- 
Dmitry
