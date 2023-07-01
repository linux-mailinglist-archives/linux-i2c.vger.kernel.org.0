Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2A7F1744846
	for <lists+linux-i2c@lfdr.de>; Sat,  1 Jul 2023 11:43:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229601AbjGAJm7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 1 Jul 2023 05:42:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229510AbjGAJm6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 1 Jul 2023 05:42:58 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAC831FCB
        for <linux-i2c@vger.kernel.org>; Sat,  1 Jul 2023 02:42:54 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f8735ac3e3so4475612e87.2
        for <linux-i2c@vger.kernel.org>; Sat, 01 Jul 2023 02:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688204572; x=1690796572;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jVKGxXT/PT8/gWcRFXr+cumptrUIAK2qeLXZT9hhLHs=;
        b=KhDBngl0Li4fh5DQyreiH2EbOILrxcoiK4otIhZwTTgBxHH78OkU1y+5G/w/e6Db7p
         IQIFOTivc9gz3XP8sAOPYO+F0Kwb9PgkRDO9X4YJrsyiU/llOJEYt7cLh2KBfNAgQrER
         v7N3srv1B4tB5Z1Fylz51VlDQSYYbA0KK6vOEsD/LsyeXdg5LJb8sQmyCz0LnyrAdGnV
         kyqFqdyy/sHLTwFgeZZwjF4YXqpv3LCrvh5inJ/3s/3CxJsXxqLXjRPqfMCjBkNh0RAd
         P1XOrPGSAHtXBVHjZqScxmOX+72eP0my2HUnhbLveZTZSjM5W9ZUPKgnCqhTqxfLsp+9
         1B3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688204572; x=1690796572;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jVKGxXT/PT8/gWcRFXr+cumptrUIAK2qeLXZT9hhLHs=;
        b=inqWOnIyIGYvkKSe9x3GEqsbvfpKNFNYXlTdyXf0niLAPndo+PuGNgbFbagOP+m1X5
         1jkcbXc80StdOf8sWuuuwpobBBaAl0Z0A1vBn4frqkDa/Adn+ArH0TnFpgnFuUliIp26
         8FNdE19nUMfQInDZ9apbuL6TV9rDDCUv1dS0e6i65i/ATIS3rOfjndq3XON4ARh4tM82
         plZNFqjrrevwKcnHGPwiyHXudjP/f5wOpZvTvMioxK1+eK9eslUwn5rokN3myQytnL0d
         BfoiZlg0My99rkxl1wWuUzCO+PpcI7NANdxTB3U2bC6K2gT5SY7uN4OEmPWk3CAvMcii
         K3aw==
X-Gm-Message-State: ABy/qLazaJL7lcmSKzqT8c9zEPQqYxjto3PdGAq7t9jsSJTp8mQIuCki
        TrSU/dmlTLZhvr0ulerkjJyaCg==
X-Google-Smtp-Source: APBJJlFTO6gH6KHECB9oa1NBkb6ECCZ8hpxO3B3EWe2Xt7RCf7WkW0MPzIRX3eAeCNRwl1l0vOeSNA==
X-Received: by 2002:a05:6512:3e29:b0:4fb:73b5:e1cf with SMTP id i41-20020a0565123e2900b004fb73b5e1cfmr4986361lfv.64.1688204572292;
        Sat, 01 Jul 2023 02:42:52 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t24-20020a1c7718000000b003fba9db141esm11112344wmi.38.2023.07.01.02.42.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jul 2023 02:42:50 -0700 (PDT)
Date:   Sat, 1 Jul 2023 12:42:47 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] i2c: sun6i-p2wi: Fix an error message in probe()
Message-ID: <8a909e78-111d-443d-b2e2-105c04cb2062@kadam.mountain>
References: <98afbc28-3366-459e-bd01-f77cf1a67fe9@moroto.mountain>
 <20230627115920.c4ms65vgrbiyekc6@intel.intel>
 <7c6db53c-427d-4ba5-80b7-a069ab9322a0@kadam.mountain>
 <85f98e39-1f66-8049-91a4-d11c3003877d@wanadoo.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="L+82tpLgqaVmqBPS"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <85f98e39-1f66-8049-91a4-d11c3003877d@wanadoo.fr>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--L+82tpLgqaVmqBPS
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Fri, Jun 30, 2023 at 09:58:49PM +0200, Christophe JAILLET wrote:
> Le 27/06/2023 à 14:08, Dan Carpenter a écrit :
> > On Tue, Jun 27, 2023 at 01:59:20PM +0200, Andi Shyti wrote:
> > > Hi Dan,
> > > 
> > > On Tue, Jun 27, 2023 at 10:12:36AM +0300, Dan Carpenter wrote:
> > > > The "ret" variable is uninitialized.  It was the "p2wi->rstc" variable
> > > > that was intended.  We can also use the %pe string format to print the
> > > > error code name instead of just the number.
> > > > 
> > > > Fixes: 75ff8a340a81 ("i2c: sun6i-p2wi: Use devm_clk_get_enabled()")
> > > > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> > > > ---
> > > >   drivers/i2c/busses/i2c-sun6i-p2wi.c | 3 ++-
> > > >   1 file changed, 2 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/drivers/i2c/busses/i2c-sun6i-p2wi.c b/drivers/i2c/busses/i2c-sun6i-p2wi.c
> > > > index ad8270cdbd3e..fa6020dced59 100644
> > > > --- a/drivers/i2c/busses/i2c-sun6i-p2wi.c
> > > > +++ b/drivers/i2c/busses/i2c-sun6i-p2wi.c
> > > > @@ -250,7 +250,8 @@ static int p2wi_probe(struct platform_device *pdev)
> > > >   	p2wi->rstc = devm_reset_control_get_exclusive(dev, NULL);
> > > >   	if (IS_ERR(p2wi->rstc)) {
> > > > -		dev_err(dev, "failed to retrieve reset controller: %d\n", ret);
> > > > +		dev_err(dev, "failed to retrieve reset controller: %pe\n",
> > > > +			p2wi->rstc);
> > > 
> > > Yes, good catch! Thanks! But I think we want to print the error
> > > value here, so I think it should be:
> > > 
> > > -		dev_err(dev, "failed to retrieve reset controller: %d\n", ret);
> > > +		dev_err(dev, "failed to retrieve reset controller: %d\n",
> > > +			PTR_ERR(p2wi->rstc));
> > > 
> > 
> > The %pe which I changed it to is a cool new thing that prints:
> > 
> > 	failed to retrieve reset controller: -EINVAL\n
> > 
> > We should create a similar %e printk format that works for ints instead
> > of error pointers.  But instead of that you have people who cast error
> > codes to pointers just to get the %pe functionality.  And other people
> > who make suggestions (this is the catagory that I'm in) but are too lazy
> > to do the actual work.
> 
> Hi Dan,
> 
> why not switch to dev_err_probe()?

I did consider it, but didn't because of the one thing per patch rule.

Btw, I created a static checker warning to encourage people to use
dev_err_probe().  I'll publish that next week.  But the warnings look
good.

regards,
dan carpenter


--L+82tpLgqaVmqBPS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=err-list

drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c:347 ns2_drd_phy_probe() EPROBE_DEFER path should not print warnings
drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c:353 ns2_drd_phy_probe() EPROBE_DEFER path should not print warnings
drivers/phy/tegra/xusb-tegra186.c:1460 tegra186_xusb_read_fuse_calibration() EPROBE_DEFER path should not print warnings
drivers/phy/allwinner/phy-sun4i-usb.c:796 sun4i_usb_phy_probe() EPROBE_DEFER path should not print warnings
drivers/phy/motorola/phy-mapphone-mdm6600.c:485 phy_mdm6600_deferred_power_on() EPROBE_DEFER path should not print warnings
drivers/usb/common/usb-conn-gpio.c:226 usb_conn_probe() EPROBE_DEFER path should not print warnings
drivers/usb/common/usb-conn-gpio.c:243 usb_conn_probe() EPROBE_DEFER path should not print warnings
drivers/usb/misc/brcmstb-usb-pinmap.c:311 brcmstb_usb_pinmap_probe() EPROBE_DEFER path should not print warnings
drivers/usb/typec/tcpm/fusb302.c:1640 init_gpio() EPROBE_DEFER path should not print warnings
drivers/usb/typec/ucsi/ucsi.c:1471 ucsi_init_work() EPROBE_DEFER path should not print warnings
drivers/usb/typec/anx7411.c:1339 anx7411_get_gpio_irq() EPROBE_DEFER path should not print warnings
drivers/mtd/nand/raw/brcmnand/brcmnand.c:2983 brcmnand_edu_setup() EPROBE_DEFER path should not print warnings
drivers/edac/xgene_edac.c:1921 xgene_edac_probe() EPROBE_DEFER path should not print warnings
drivers/platform/surface/surface_hotplug.c:239 surface_hotplug_probe() EPROBE_DEFER path should not print warnings
drivers/power/supply/sc27xx_fuel_gauge.c:1239 sc27xx_fgu_probe() EPROBE_DEFER path should not print warnings
drivers/power/supply/lt3651-charger.c:159 lt3651_charger_probe() EPROBE_DEFER path should not print warnings
drivers/power/supply/lt3651-charger.c:169 lt3651_charger_probe() EPROBE_DEFER path should not print warnings
drivers/power/supply/lt3651-charger.c:179 lt3651_charger_probe() EPROBE_DEFER path should not print warnings
drivers/firmware/imx/imx-scu.c:332 imx_scu_probe() EPROBE_DEFER path should not print warnings
drivers/firmware/imx/imx-scu.c:336 imx_scu_probe() EPROBE_DEFER path should not print warnings
drivers/uio/uio_dfl.c:42 uio_dfl_probe() EPROBE_DEFER path should not print warnings
drivers/uio/uio_hv_generic.c:337 hv_uio_probe() EPROBE_DEFER path should not print warnings
drivers/uio/uio_pdrv_genirq.c:250 uio_pdrv_genirq_probe() EPROBE_DEFER path should not print warnings
drivers/rtc/rtc-ds2404.c:58 ds2404_gpio_map() EPROBE_DEFER path should not print warnings
drivers/pci/controller/dwc/pcie-tegra194.c:2064 tegra_pcie_config_ep() EPROBE_DEFER path should not print warnings
drivers/pci/controller/dwc/pci-imx6.c:1301 imx6_pcie_probe() EPROBE_DEFER path should not print warnings
drivers/pci/controller/pcie-mt7621.c:224 mt7621_pcie_parse_port() EPROBE_DEFER path should not print warnings
drivers/tty/serial/serial_mctrl_gpio.c:243 mctrl_gpio_init() EPROBE_DEFER path should not print warnings
drivers/mfd/wm8994-irq.c:211 wm8994_irq_init() EPROBE_DEFER path should not print warnings
drivers/mfd/lm3533-core.c:492 lm3533_device_init() EPROBE_DEFER path should not print warnings
drivers/mfd/arizona-irq.c:367 arizona_irq_init() EPROBE_DEFER path should not print warnings
drivers/mfd/aat2870-core.c:373 aat2870_i2c_probe() EPROBE_DEFER path should not print warnings
drivers/mfd/si476x-i2c.c:725 si476x_core_probe() EPROBE_DEFER path should not print warnings
drivers/mfd/stmpe.c:1447 stmpe_probe() EPROBE_DEFER path should not print warnings
drivers/thermal/tegra/tegra30-tsensor.c:451 tegra_tsensor_nvmem_setup() EPROBE_DEFER path should not print warnings
drivers/extcon/extcon-usb-gpio.c:154 usb_extcon_probe() EPROBE_DEFER path should not print warnings
drivers/extcon/extcon-usb-gpio.c:172 usb_extcon_probe() EPROBE_DEFER path should not print warnings
drivers/extcon/extcon-intel-int3496.c:147 int3496_probe() EPROBE_DEFER path should not print warnings
drivers/extcon/extcon-max3355.c:93 max3355_probe() EPROBE_DEFER path should not print warnings
drivers/extcon/extcon-palmas.c:287 palmas_usb_probe() EPROBE_DEFER path should not print warnings
drivers/extcon/extcon-palmas.c:338 palmas_usb_probe() EPROBE_DEFER path should not print warnings
drivers/extcon/extcon-ptn5150.c:273 ptn5150_i2c_probe() EPROBE_DEFER path should not print warnings
drivers/spi/spi-mtk-nor.c:898 mtk_nor_probe() EPROBE_DEFER path should not print warnings
drivers/gpu/host1x/context.c:72 host1x_memory_context_list_init() EPROBE_DEFER path should not print warnings
drivers/gpu/host1x/dev.c:570 host1x_probe() EPROBE_DEFER path should not print warnings
drivers/gpu/drm/vc4/vc4_hdmi.c:2759 vc4_hdmi_audio_init() EPROBE_DEFER path should not print warnings
drivers/gpu/drm/bridge/sil-sii8620.c:2332 sii8620_probe() EPROBE_DEFER path should not print warnings
drivers/gpu/drm/display/drm_dp_aux_bus.c:78 dp_aux_ep_probe() EPROBE_DEFER path should not print warnings
drivers/gpu/drm/sun4i/sun8i_dw_hdmi.c:174 sun8i_dw_hdmi_bind() EPROBE_DEFER path should not print warnings
drivers/gpu/drm/pl111/pl111_versatile.c:494 pl111_versatile_init() EPROBE_DEFER path should not print warnings
drivers/gpu/drm/tegra/output.c:154 tegra_output_probe() EPROBE_DEFER path should not print warnings
drivers/gpu/drm/amd/amdgpu/amdgpu_acp.c:171 acp_genpd_add_device() EPROBE_DEFER path should not print warnings
drivers/gpu/drm/msm/adreno/a5xx_gpu.c:990 a5xx_hw_init() EPROBE_DEFER path should not print warnings
drivers/gpu/drm/msm/adreno/a6xx_gpu.c:1437 hw_init() EPROBE_DEFER path should not print warnings
drivers/cxl/pci.c:841 cxl_pci_probe() EPROBE_DEFER path should not print warnings
drivers/regulator/vctrl-regulator.c:195 vctrl_set_voltage_sel() EPROBE_DEFER path should not print warnings
drivers/regulator/vctrl-regulator.c:219 vctrl_set_voltage_sel() EPROBE_DEFER path should not print warnings
drivers/regulator/vctrl-regulator.c:502 vctrl_probe() EPROBE_DEFER path should not print warnings
drivers/regulator/max8973-regulator.c:683 max8973_probe() EPROBE_DEFER path should not print warnings
drivers/memory/samsung/exynos5422-dmc.c:1511 exynos5_dmc_probe() EPROBE_DEFER path should not print warnings
drivers/hid/hid-cp2112.c:1217 cp2112_allocate_irq() EPROBE_DEFER path should not print warnings
drivers/hwtracing/intel_th/sth.c:230 intel_th_sth_probe() EPROBE_DEFER path should not print warnings
drivers/media/usb/em28xx/em28xx-dvb.c:742 em28xx_pctv_290e_set_lna() EPROBE_DEFER path should not print warnings
drivers/media/usb/em28xx/em28xx-dvb.c:1713 em28xx_dvb_init() EPROBE_DEFER path should not print warnings
drivers/media/platform/mediatek/mdp/mtk_mdp_core.c:200 mtk_mdp_probe() EPROBE_DEFER path should not print warnings
drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c:1102 mtk_mdp_m2m_open() EPROBE_DEFER path should not print warnings
drivers/media/platform/mediatek/mdp/mtk_mdp_vpu.c:69 mtk_mdp_vpu_register() EPROBE_DEFER path should not print warnings
drivers/media/platform/mediatek/mdp3/mtk-mdp3-m2m.c:154 mdp_m2m_start_streaming() EPROBE_DEFER path should not print warnings
drivers/media/platform/mediatek/mdp3/mtk-mdp3-vpu.c:132 mdp_vpu_register() EPROBE_DEFER path should not print warnings
drivers/media/platform/mediatek/mdp3/mtk-mdp3-core.c:99 mdp_vpu_get_locked() EPROBE_DEFER path should not print warnings
drivers/media/dvb-frontends/tc90522.c:583 tc90522_sleep() EPROBE_DEFER path should not print warnings
drivers/media/dvb-frontends/tc90522.c:616 tc90522_init() EPROBE_DEFER path should not print warnings
drivers/media/pci/sta2x11/sta2x11_vip.c:901 vip_gpio_reserve() EPROBE_DEFER path should not print warnings
drivers/media/cec/platform/seco/seco-cec.c:549 secocec_acpi_probe() EPROBE_DEFER path should not print warnings
drivers/bluetooth/hci_intel.c:1170 intel_probe() EPROBE_DEFER path should not print warnings
drivers/input/keyboard/gpio_keys_polled.c:323 gpio_keys_polled_probe() EPROBE_DEFER path should not print warnings
drivers/input/keyboard/matrix_keypad.c:315 matrix_keypad_init_gpio() EPROBE_DEFER path should not print warnings
drivers/input/keyboard/matrix_keypad.c:327 matrix_keypad_init_gpio() EPROBE_DEFER path should not print warnings
drivers/input/keyboard/imx_sc_key.c:157 imx_sc_key_probe() EPROBE_DEFER path should not print warnings
drivers/input/keyboard/gpio_keys.c:551 gpio_keys_setup_key() EPROBE_DEFER path should not print warnings
drivers/input/keyboard/gpio_keys.c:587 gpio_keys_setup_key() EPROBE_DEFER path should not print warnings
drivers/input/joystick/as5011.c:267 as5011_probe() EPROBE_DEFER path should not print warnings
drivers/video/backlight/hx8357.c:614 hx8357_probe() EPROBE_DEFER path should not print warnings
drivers/video/backlight/hx8357.c:639 hx8357_probe() EPROBE_DEFER path should not print warnings
drivers/cpufreq/imx6q-cpufreq.c:496 imx6q_cpufreq_probe() EPROBE_DEFER path should not print warnings
drivers/cpufreq/scmi-cpufreq.c:319 scmi_cpufreq_probe() EPROBE_DEFER path should not print warnings
drivers/cpufreq/scpi-cpufreq.c:206 scpi_cpufreq_probe() EPROBE_DEFER path should not print warnings
drivers/cpufreq/qcom-cpufreq-hw.c:726 qcom_cpufreq_hw_driver_probe() EPROBE_DEFER path should not print warnings
drivers/cpufreq/mediatek-cpufreq.c:89 mtk_cpufreq_voltage_tracking() EPROBE_DEFER path should not print warnings
drivers/cpufreq/mediatek-cpufreq.c:96 mtk_cpufreq_voltage_tracking() EPROBE_DEFER path should not print warnings
drivers/cpufreq/mediatek-cpufreq.c:224 mtk_cpufreq_set_target() EPROBE_DEFER path should not print warnings
drivers/cpufreq/mediatek-cpufreq.c:257 mtk_cpufreq_set_target() EPROBE_DEFER path should not print warnings
drivers/cpufreq/mediatek-cpufreq.c:299 mtk_cpufreq_set_target() EPROBE_DEFER path should not print warnings
drivers/cpufreq/mediatek-cpufreq.c:338 mtk_cpufreq_opp_notifier() EPROBE_DEFER path should not print warnings
drivers/cpufreq/mediatek-cpufreq.c:482 mtk_cpu_dvfs_info_init() EPROBE_DEFER path should not print warnings
drivers/cpufreq/mediatek-cpufreq.c:654 mtk_cpufreq_probe() EPROBE_DEFER path should not print warnings
drivers/cpufreq/mediatek-cpufreq.c:665 mtk_cpufreq_probe() EPROBE_DEFER path should not print warnings
drivers/cpufreq/mediatek-cpufreq-hw.c:313 mtk_cpufreq_hw_driver_probe() EPROBE_DEFER path should not print warnings
drivers/cpufreq/cpufreq-dt.c:342 dt_cpufreq_probe() EPROBE_DEFER path should not print warnings
drivers/cpufreq/ti-cpufreq.c:421 ti_cpufreq_probe() EPROBE_DEFER path should not print warnings
drivers/pinctrl/pinctrl-pistachio.c:1393 pistachio_gpio_register() EPROBE_DEFER path should not print warnings
drivers/pinctrl/renesas/pinctrl-rzg2l.c:1454 rzg2l_pinctrl_register() EPROBE_DEFER path should not print warnings
drivers/mmc/host/litex_mmc.c:482 litex_mmc_irq_init() EPROBE_DEFER path should not print warnings
drivers/mmc/host/mmci.c:857 mmci_dmae_setup() EPROBE_DEFER path should not print warnings
drivers/nfc/nfcmrvl/main.c:121 nfcmrvl_nci_register_dev() EPROBE_DEFER path should not print warnings
drivers/devfreq/tegra30-devfreq.c:895 tegra_devfreq_probe() EPROBE_DEFER path should not print warnings
drivers/devfreq/mtk-cci-devfreq.c:55 mtk_ccifreq_set_voltage() EPROBE_DEFER path should not print warnings
drivers/devfreq/mtk-cci-devfreq.c:61 mtk_ccifreq_set_voltage() EPROBE_DEFER path should not print warnings
drivers/devfreq/mtk-cci-devfreq.c:158 mtk_ccifreq_target() EPROBE_DEFER path should not print warnings
drivers/remoteproc/imx_dsp_rproc.c:1127 imx_dsp_rproc_probe() EPROBE_DEFER path should not print warnings
drivers/remoteproc/imx_rproc.c:977 imx_rproc_detect_mode() EPROBE_DEFER path should not print warnings
drivers/rpmsg/qcom_glink_smem.c:269 qcom_glink_smem_register() EPROBE_DEFER path should not print warnings
drivers/rpmsg/qcom_glink_smem.c:295 qcom_glink_smem_register() EPROBE_DEFER path should not print warnings
drivers/rpmsg/rpmsg_core.c:546 rpmsg_dev_probe() EPROBE_DEFER path should not print warnings
drivers/net/wireless/intersil/p54/p54spi.c:613 p54spi_probe() EPROBE_DEFER path should not print warnings
drivers/net/wireless/intersil/p54/p54spi.c:619 p54spi_probe() EPROBE_DEFER path should not print warnings
drivers/net/ethernet/mellanox/mlx4/main.c:4232 mlx4_restart_one_up() EPROBE_DEFER path should not print warnings
drivers/net/ethernet/mellanox/mlx4/main.c:4369 mlx4_pci_resume() EPROBE_DEFER path should not print warnings
drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c:396 stm32_dwmac_probe() EPROBE_DEFER path should not print warnings
drivers/net/ipa/ipa_mem.c:552 ipa_smem_init() EPROBE_DEFER path should not print warnings
drivers/net/ipa/ipa_mem.c:567 ipa_smem_init() EPROBE_DEFER path should not print warnings
drivers/watchdog/imx_sc_wdt.c:190 imx_sc_wdt_probe() EPROBE_DEFER path should not print warnings
drivers/iio/dac/mcp4922.c:149 mcp4922_probe() EPROBE_DEFER path should not print warnings
drivers/iio/dac/max5821.c:346 max5821_probe() EPROBE_DEFER path should not print warnings
drivers/iio/dac/ad7293.c:845 ad7293_init() EPROBE_DEFER path should not print warnings
drivers/iio/dac/ad7293.c:854 ad7293_init() EPROBE_DEFER path should not print warnings
drivers/iio/dac/ltc1660.c:62 ltc1660_read_raw() EPROBE_DEFER path should not print warnings
drivers/iio/dac/ad8801.c:139 ad8801_probe() EPROBE_DEFER path should not print warnings
drivers/iio/dac/ad8801.c:162 ad8801_probe() EPROBE_DEFER path should not print warnings
drivers/iio/dac/stm32-dac-core.c:136 stm32_dac_probe() EPROBE_DEFER path should not print warnings
drivers/iio/dac/ad5761.c:324 ad5761_get_vref() EPROBE_DEFER path should not print warnings
drivers/iio/proximity/srf04.c:304 srf04_probe() EPROBE_DEFER path should not print warnings
drivers/iio/proximity/ping.c:121 ping_read() EPROBE_DEFER path should not print warnings
drivers/iio/humidity/dht11.c:311 dht11_probe() EPROBE_DEFER path should not print warnings
drivers/iio/light/gp2ap002.c:539 gp2ap002_probe() EPROBE_DEFER path should not print warnings
drivers/iio/adc/ad7192.c:1019 ad7192_probe() EPROBE_DEFER path should not print warnings
drivers/iio/adc/meson_saradc.c:604 meson_sar_adc_iio_info_read_raw() EPROBE_DEFER path should not print warnings
drivers/iio/adc/stm32-adc-core.c:541 stm32_adc_core_hw_start() EPROBE_DEFER path should not print warnings
drivers/iio/adc/stm32-adc-core.c:649 stm32_adc_core_switches_probe() EPROBE_DEFER path should not print warnings
drivers/iio/adc/stm32-adc-core.c:772 stm32_adc_probe() EPROBE_DEFER path should not print warnings
drivers/iio/adc/ti-adc108s102.c:255 adc108s102_probe() EPROBE_DEFER path should not print warnings
drivers/iio/adc/mcp3911.c:280 mcp3911_calc_scale_table() EPROBE_DEFER path should not print warnings
drivers/gpio/gpiolib-acpi.c:458 acpi_gpiochip_alloc_event() EPROBE_DEFER path should not print warnings
drivers/gpio/gpio-bcm-kona.c:588 bcm_kona_gpio_probe() EPROBE_DEFER path should not print warnings
drivers/gpio/gpio-bcm-kona.c:609 bcm_kona_gpio_probe() EPROBE_DEFER path should not print warnings
drivers/gpio/gpio-bcm-kona.c:625 bcm_kona_gpio_probe() EPROBE_DEFER path should not print warnings
drivers/gpio/gpio-bcm-kona.c:637 bcm_kona_gpio_probe() EPROBE_DEFER path should not print warnings
drivers/hte/hte-tegra194-test.c:140 tegra_hte_test_probe() EPROBE_DEFER path should not print warnings
drivers/vfio/fsl-mc/vfio_fsl_mc.c:474 vfio_fsl_mc_init_device() EPROBE_DEFER path should not print warnings
drivers/base/platform.c:1411 platform_probe() EPROBE_DEFER path should not print warnings
drivers/soc/rockchip/io-domain.c:637 rockchip_iodomain_probe() EPROBE_DEFER path should not print warnings
drivers/soc/tegra/common.c:139 devm_tegra_core_dev_init_opp_table() EPROBE_DEFER path should not print warnings
drivers/soc/tegra/cbb/tegra194-cbb.c:2259 tegra194_cbb_probe() EPROBE_DEFER path should not print warnings
drivers/soc/tegra/cbb/tegra-cbb.c:130 tegra_cbb_get_irq() EPROBE_DEFER path should not print warnings
drivers/soc/tegra/cbb/tegra-cbb.c:140 tegra_cbb_get_irq() EPROBE_DEFER path should not print warnings
drivers/soc/qcom/smsm.c:535 qcom_smsm_probe() EPROBE_DEFER path should not print warnings
drivers/soc/qcom/smsm.c:550 qcom_smsm_probe() EPROBE_DEFER path should not print warnings
drivers/soc/qcom/cpr.c:941 cpr_fuse_corner_init() EPROBE_DEFER path should not print warnings
sound/soc/bcm/bcm2835-i2s.c:904 bcm2835_i2s_probe() EPROBE_DEFER path should not print warnings
sound/soc/sof/imx/imx8.c:245 imx8_probe() EPROBE_DEFER path should not print warnings
sound/soc/codecs/tlv320aic32x4.c:1385 aic32x4_probe() EPROBE_DEFER path should not print warnings
sound/soc/codecs/wm1250-ev1.c:174 wm1250_ev1_pdata() EPROBE_DEFER path should not print warnings
sound/soc/codecs/tas2780.c:618 tas2780_i2c_probe() EPROBE_DEFER path should not print warnings
sound/soc/codecs/arizona-jack.c:1331 arizona_jack_codec_dev_probe() EPROBE_DEFER path should not print warnings
sound/soc/codecs/arizona-jack.c:1363 arizona_jack_codec_dev_probe() EPROBE_DEFER path should not print warnings
sound/soc/codecs/cs42l56.c:1206 cs42l56_i2c_probe() EPROBE_DEFER path should not print warnings
sound/soc/codecs/twl4030.c:266 twl4030_init_chip() EPROBE_DEFER path should not print warnings
sound/soc/codecs/tas2764.c:728 tas2764_i2c_probe() EPROBE_DEFER path should not print warnings
sound/soc/codecs/tlv320dac33.c:1507 dac33_i2c_probe() EPROBE_DEFER path should not print warnings
sound/soc/codecs/cs42l73.c:1321 cs42l73_i2c_probe() EPROBE_DEFER path should not print warnings
sound/soc/codecs/tas2781-i2c.c:673 tasdevice_parse_dt() EPROBE_DEFER path should not print warnings
sound/soc/codecs/da7219.c:1882 da7219_handle_supplies() EPROBE_DEFER path should not print warnings
sound/soc/codecs/max98373-i2c.c:568 max98373_i2c_probe() EPROBE_DEFER path should not print warnings
sound/soc/codecs/wm0010.c:922 wm0010_spi_probe() EPROBE_DEFER path should not print warnings
sound/soc/codecs/rt5670.c:596 rt5670_set_jack_detect() EPROBE_DEFER path should not print warnings
sound/soc/codecs/wm5100.c:2356 wm5100_probe() EPROBE_DEFER path should not print warnings
sound/soc/codecs/wm5100.c:2467 wm5100_i2c_probe() EPROBE_DEFER path should not print warnings
sound/soc/codecs/wm5100.c:2478 wm5100_i2c_probe() EPROBE_DEFER path should not print warnings
sound/soc/codecs/rt5640.c:3037 rt5640_i2c_probe() EPROBE_DEFER path should not print warnings
sound/soc/codecs/tas2770.c:682 tas2770_i2c_probe() EPROBE_DEFER path should not print warnings
sound/soc/codecs/da7218.c:2655 da7218_handle_supplies() EPROBE_DEFER path should not print warnings
sound/soc/codecs/tpa6130a2.c:261 tpa6130a2_probe() EPROBE_DEFER path should not print warnings
sound/soc/codecs/wm2200.c:2254 wm2200_i2c_probe() EPROBE_DEFER path should not print warnings
sound/soc/codecs/wm2200.c:2266 wm2200_i2c_probe() EPROBE_DEFER path should not print warnings
sound/soc/codecs/cs42l52.c:1148 cs42l52_i2c_probe() EPROBE_DEFER path should not print warnings
sound/soc/codecs/wm8996.c:2778 wm8996_i2c_probe() EPROBE_DEFER path should not print warnings
sound/soc/samsung/aries_wm8994.c:377 aries_late_probe() EPROBE_DEFER path should not print warnings
sound/soc/rockchip/rockchip_i2s_tdm.c:1708 rockchip_i2s_tdm_probe() EPROBE_DEFER path should not print warnings
sound/soc/rockchip/rockchip_spdif.c:355 rk_spdif_probe() EPROBE_DEFER path should not print warnings
sound/soc/rockchip/rk3288_hdmi_analog.c:199 snd_rk_mc_probe() EPROBE_DEFER path should not print warnings
sound/soc/rockchip/rockchip_pdm.c:647 rockchip_pdm_probe() EPROBE_DEFER path should not print warnings
sound/soc/rockchip/rockchip_i2s.c:838 rockchip_i2s_probe() EPROBE_DEFER path should not print warnings
sound/soc/starfive/jh7110_tdm.c:618 jh7110_tdm_probe() EPROBE_DEFER path should not print warnings
sound/soc/dwc/dwc-i2s.c:736 dw_i2s_probe() EPROBE_DEFER path should not print warnings
sound/soc/sunxi/sun4i-spdif.c:675 sun4i_spdif_probe() EPROBE_DEFER path should not print warnings
sound/soc/sunxi/sun4i-codec.c:1795 sun4i_codec_probe() EPROBE_DEFER path should not print warnings
sound/soc/sunxi/sun4i-i2s.c:1584 sun4i_i2s_probe() EPROBE_DEFER path should not print warnings
sound/soc/tegra/tegra20_ac97.c:352 tegra20_ac97_platform_probe() EPROBE_DEFER path should not print warnings
sound/soc/tegra/tegra_asoc_machine.c:165 tegra_asoc_machine_init() EPROBE_DEFER path should not print warnings
sound/soc/tegra/tegra_asoc_machine.c:185 tegra_asoc_machine_init() EPROBE_DEFER path should not print warnings
sound/soc/tegra/tegra_asoc_machine.c:211 tegra_asoc_machine_init() EPROBE_DEFER path should not print warnings
sound/soc/soc-topology.c:1735 soc_tplg_fe_link_create() EPROBE_DEFER path should not print warnings
sound/soc/intel/boards/kbl_rt5660.c:186 kabylake_rt5660_codec_init() EPROBE_DEFER path should not print warnings
sound/soc/intel/boards/kbl_rt5660.c:199 kabylake_rt5660_codec_init() EPROBE_DEFER path should not print warnings
sound/soc/intel/avs/boards/hdaudio.c:148 avs_probing_link_init() EPROBE_DEFER path should not print warnings
sound/soc/intel/keembay/kmb_platform.c:904 kmb_plat_dai_probe() EPROBE_DEFER path should not print warnings
sound/soc/fsl/fsl_xcvr.c:1327 fsl_xcvr_probe() EPROBE_DEFER path should not print warnings
sound/soc/fsl/fsl_micfil.c:1161 fsl_micfil_probe() EPROBE_DEFER path should not print warnings
sound/soc/fsl/fsl_aud2htx.c:243 fsl_aud2htx_probe() EPROBE_DEFER path should not print warnings
sound/soc/atmel/mchp-spdifrx.c:1161 mchp_spdifrx_probe() EPROBE_DEFER path should not print warnings
sound/soc/atmel/atmel-pdmic.c:659 atmel_pdmic_probe() EPROBE_DEFER path should not print warnings
sound/soc/atmel/atmel-classd.c:583 atmel_classd_probe() EPROBE_DEFER path should not print warnings
sound/soc/atmel/mchp-pdmc.c:1106 mchp_pdmc_probe() EPROBE_DEFER path should not print warnings
sound/soc/atmel/atmel-i2s.c:712 atmel_i2s_probe() EPROBE_DEFER path should not print warnings
sound/soc/atmel/mchp-spdiftx.c:857 mchp_spdiftx_probe() EPROBE_DEFER path should not print warnings
sound/soc/atmel/mchp-i2s-mcc.c:1078 mchp_i2s_mcc_probe() EPROBE_DEFER path should not print warnings
sound/soc/mediatek/mt2701/mt2701-cs42448.c:391 mt2701_cs42448_machine_probe() EPROBE_DEFER path should not print warnings
sound/soc/mediatek/mt2701/mt2701-cs42448.c:402 mt2701_cs42448_machine_probe() EPROBE_DEFER path should not print warnings
sound/soc/mediatek/mt2701/mt2701-afe-pcm.c:1402 mt2701_afe_pcm_dev_probe() EPROBE_DEFER path should not print warnings

--L+82tpLgqaVmqBPS--
